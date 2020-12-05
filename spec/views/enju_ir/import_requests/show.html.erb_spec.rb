require 'rails_helper'

RSpec.describe "enju_ir/import_requests/show", type: :view do
  fixtures :all

  before(:each) do
    @import_request = assign(:import_request, EnjuIr::ImportRequest.create!(
      doi_record: FactoryBot.create(:doi_record),
      user: users(:user1)
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
