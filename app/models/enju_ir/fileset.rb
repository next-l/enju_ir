module EnjuIr
  class Fileset < ApplicationRecord
    belongs_to :enju_ir_dataset, class_name: 'EnjuIr::Dataset'
    has_many :enju_ir_fileset_transitions, autosave: false, class_name: 'EnjuIr::FilesetTransition'
has_one_attached :attachment

    include Statesman::Adapters::ActiveRecordQueries[
      transition_class: FilesetTransition,
      initial_state: :pending
    ]

    def state_machine
      @state_machine ||= FilesetStateMachine.new(self, transition_class: FilesetTransition)
    end
  end
end

# == Schema Information
#
# Table name: enju_ir_filesets
#
#  id                 :uuid             not null, primary key
#  enju_ir_dataset_id :uuid             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
