FactoryBot.define do
  factory :fileset, class: EnjuIr::Fileset do
    association :enju_ir_dataset, factory: :dataset
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
