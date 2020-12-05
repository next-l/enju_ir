require 'rails_helper'

RSpec.describe "collections/index", type: :view do
  before(:each) do
    assign(:collections, [
      EnjuIr::Collection.create!(
        title_translations: "",
        user: nil
      ),
      EnjuIr::Collection.create!(
        title_translations: "",
        user: nil
      )
    ])
  end

  it "renders a list of collections" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
