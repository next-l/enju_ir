require 'rails_helper'

RSpec.describe "enju_ir/import_requests/index", type: :view do
  fixtures :all

  before(:each) do
    assign(:import_requests, [
      EnjuIr::ImportRequest.create!(
        doi_record: FactoryBot.create(:doi_record),
        user: users(:user1)
      ),
      EnjuIr::ImportRequest.create!(
        doi_record: FactoryBot.create(:doi_record),
        user: users(:user1)
      )
    ])
  end

  it "renders a list of import_requests" do
    render
  end
end
