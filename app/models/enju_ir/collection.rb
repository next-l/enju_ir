module EnjuIr
  class Collection < ApplicationRecord
    belongs_to :user, class_name: '::User'
    has_many :enju_ir_collection_and_datasets, class_name: 'EnjuIr::CollectionAndDataset', foreign_key: :enju_ir_collection_id, dependent: :destroy
    has_many :enju_ir_datasets, class_name: 'EnjuIr::Dataset', through: :enju_ir_collection_and_datasets, dependent: :destroy

    translates :title

    validates :title, presence: true
  end
end

# == Schema Information
#
# Table name: enju_ir_collections
#
#  id                 :uuid             not null, primary key
#  title_translations :jsonb            not null
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
