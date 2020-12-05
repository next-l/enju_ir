require 'rails_helper'

RSpec.describe "enju_ir/import_requests/edit", type: :view do
  fixtures :all

  before(:each) do
    @import_request = assign(:import_request, EnjuIr::ImportRequest.create!(
      doi_record: FactoryBot.create(:doi_record),
      user: users(:user1)
    ))
  end

  it "renders the edit import_request form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.import_request_path(@import_request), "post" do
    end
  end
end
