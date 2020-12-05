module EnjuIr
  class ImportRequest < ApplicationRecord
    belongs_to :user
    belongs_to :doi_record
  end
end

# == Schema Information
#
# Table name: enju_ir_import_requests
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  doi_record_id :bigint           not null
#  doi_string    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
