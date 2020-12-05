module EnjuIr
  class Fileset < ApplicationRecord
    belongs_to :enju_ir_dataset, class_name: 'EnjuIr::Dataset'
    has_one_attached :attachment
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
