FactoryBot.define do
  factory :dataset, class: EnjuIr::Dataset do
    association :manifestation
  end
end

# == Schema Information
#
# Table name: enju_ir_datasets
#
#  id               :uuid             not null, primary key
#  json_attributes  :jsonb            not null
#  manifestation_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
