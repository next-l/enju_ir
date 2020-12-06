module EnjuIr
  class CollectionAndDataset < ApplicationRecord
    belongs_to :enju_ir_collection, class_name: 'EnjuIr::Collection'
    belongs_to :enju_ir_dataset, class_name: 'EnjuIr::Dataset'
  end
end

# == Schema Information
#
# Table name: enju_ir_collection_and_datasets
#
#  id                    :bigint           not null, primary key
#  enju_ir_collection_id :uuid             not null
#  enju_ir_dataset_id    :uuid             not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
