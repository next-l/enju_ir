module EnjuIr
  class Dataset < ApplicationRecord
    belongs_to :user, class_name: '::User'
    belongs_to :manifestation
    has_many :enju_ir_filesets, class_name: 'EnjuIr::Fileset', foreign_key: :enju_ir_dataset_id, dependent: :destroy, inverse_of: :enju_ir_dataset
    has_many :enju_ir_collection_and_datasets, class_name: 'EnjuIr::CollectionAndDataset', foreign_key: :enju_ir_dataset_id, dependent: :destroy, inverse_of: :enju_ir_dataset
    has_many :enju_ir_collections, class_name: 'EnjuIr::Collection', through: :enju_ir_collection_and_datasets, dependent: :destroy
    has_many :enju_ir_dataset_transitions, autosave: false, class_name: 'EnjuIr::DatasetTransition'
    has_one_attached :attachment

    include AttrJson::Record
    include AttrJson::NestedAttributes
    attr_json :title, :string
    attr_json :description, :string

    attr_accessor :doi_string, :uploaded_files

    include Statesman::Adapters::ActiveRecordQueries[
      transition_class: DatasetTransition,
      initial_state: :pending
    ]

    searchable do
      text :title
    end

    def state_machine
      @state_machine ||= DatasetStateMachine.new(self, transition_class: DatasetTransition)
    end

    def attach_file(uploaded_files)
      return if uploaded_files.blank?

      uploaded_files.each do |file|
        fileset = @dataset.enju_ir_filesets.new
        fileset.attachment.attach(file)
        fileset.save!
      end
    end

    def register_doi(options = {status: 'register'})
      base_url = ENV.fetch('DATACITE_API_URL', 'https://api.test.datacite.org')
      data = EnjuIr::Datacite.new
      data.event = options[:status]

      if manifestation.doi_record
        uri = URI.parse("#{base_url}/dois/#{manifestation.doi_record.body}")
        request = Net::HTTP::Put.new(uri)
      else
        data.id = "#{ENV['ENJU_IR_DOI_PREFIX']}/#{id}"
        uri = URI.parse("#{base_url}/dois")
        request = Net::HTTP::Post.new(uri)
      end

      request.body = EnjuIr::DataciteSerializer.new(data).serializable_hash.to_json
      request.content_type = "application/vnd.api+json"
      request.basic_auth(ENV['YOUR_CLIENT_ID'], ENV['YOUR_PASSWORD'])
      req_options = {
        use_ssl: true
      }

      Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    end
  end
end

# == Schema Information
#
# Table name: enju_ir_datasets
#
#  id               :uuid             not null, primary key
#  json_attributes  :jsonb            not null
#  user_id          :bigint           not null
#  manifestation_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
