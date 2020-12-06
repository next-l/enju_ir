module EnjuIr
  class Dataset < ApplicationRecord
    belongs_to :user, class_name: '::User'
    belongs_to :manifestation
    has_many :enju_ir_filesets, class_name: 'EnjuIr::Fileset', foreign_key: :enju_ir_dataset_id, dependent: :destroy
    has_many :enju_ir_collection_and_datasets, class_name: 'EnjuIr::CollectionAndDataset', foreign_key: :enju_ir_dataset_id, dependent: :destroy
    has_many :enju_ir_collections, class_name: 'EnjuIr::Collection', through: :enju_ir_collection_and_datasets, dependent: :destroy
    has_many :enju_ir_dataset_transitions, autosave: false, class_name: 'EnjuIr::DatasetTransition'

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
