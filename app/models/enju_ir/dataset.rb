module EnjuIr
  class Dataset < ApplicationRecord
    belongs_to :user, class_name: '::User'
    belongs_to :manifestation
    has_many :enju_ir_filesets, class_name: 'EnjuIr::Fileset', foreign_key: :enju_ir_dataset_id, dependent: :destroy
    has_many :enju_ir_collection_and_datasets, class_name: 'EnjuIr::CollectionAndDataset', foreign_key: :enju_ir_dataset_id, dependent: :destroy
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

    def register_doi
      data = EnjuIr::Datacite.new
      data.id = id
      data.event = 'register'

      uri = URI.parse(ENV['DATACITE_API_URL'] || 'https://api.test.datacite.org/dois')
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(ENV['YOUR_CLIENT_ID'], ENV['YOUR_PASSWORD'])
      request.content_type = "application/vnd.api+json"
      request.body = EnjuIr::DataciteSerializer.new(data).serializable_hash.to_json

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
