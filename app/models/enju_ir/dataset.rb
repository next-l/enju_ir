module EnjuIr
  class Dataset < ApplicationRecord
    belongs_to :manifestation
    has_many :enju_ir_filesets, class_name: 'EnjuIr::Fileset', dependent: :destroy

    include AttrJson::Record
    include AttrJson::NestedAttributes
    attr_json :title, :string
    attr_json :description, :string

    searchable do
      text :title
    end
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
