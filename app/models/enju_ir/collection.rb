module EnjuIr
  class Collection < ApplicationRecord
    belongs_to :user
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
