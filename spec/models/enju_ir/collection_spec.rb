require 'rails_helper'

module EnjuIr
  RSpec.describe Collection, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
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
