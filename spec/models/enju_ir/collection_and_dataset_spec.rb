require 'rails_helper'

module EnjuIr
  RSpec.describe CollectionAndDataset, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
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
