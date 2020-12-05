require 'rails_helper'

RSpec.describe "enju_ir/import_requests/new", type: :view do
  fixtures :all

  before(:each) do
    assign(:import_request, EnjuIr::ImportRequest.new(
      doi_record: FactoryBot.create(:doi_record),
      user: users(:user1)
    ))
  end

  it "renders new import_request form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.import_requests_path, "post" do
    end
  end
end
