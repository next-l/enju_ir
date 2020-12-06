FactoryBot.define do
  factory :dataset, class: EnjuIr::Dataset do
    association :user
    association :manifestation
    sequence(:doi_string){|n| "10.5555/enju_ir_#{n}"}
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
