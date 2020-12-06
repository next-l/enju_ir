class EnjuIr::FilesetTransition < ApplicationRecord
  # If your transition table doesn't have the default `updated_at` timestamp column,
  # you'll need to configure the `updated_timestamp_column` option, setting it to
  # another column name (e.g. `:updated_on`) or `nil`.
  #
  # self.updated_timestamp_column = :updated_on
  # self.updated_timestamp_column = nil

  belongs_to :enju_ir_fileset, class_name: 'EnjuIr::Fileset', inverse_of: :enju_ir_fileset_transitions

  after_destroy :update_most_recent, if: :most_recent?

  private

  def update_most_recent
    last_transition = enju_ir_fileset.enju_ir_fileset_transitions.order(:sort_key).last
    return unless last_transition.present?
    last_transition.update_column(:most_recent, true)
  end
end

# == Schema Information
#
# Table name: enju_ir_fileset_transitions
#
#  id                 :bigint           not null, primary key
#  to_state           :string           not null
#  metadata           :jsonb
#  sort_key           :integer          not null
#  enju_ir_fileset_id :uuid             not null
#  most_recent        :boolean          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
