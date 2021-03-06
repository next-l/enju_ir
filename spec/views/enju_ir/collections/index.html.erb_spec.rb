require 'rails_helper'

RSpec.describe "enju_ir/collections/index", type: :view do
  fixtures :all

  before(:each) do
    assign(:collections, [
      EnjuIr::Collection.create!(
        title: "test",
        user: users(:user1)
      ),
      EnjuIr::Collection.create!(
        title: "test",
        user: users(:user1)
      )
    ])
  end

  it "renders a list of collections" do
    render
    assert_select "tr>td", text: "test".to_s, count: 2
    assert_select "tr>td", text: users(:user1).username, count: 2
  end
end
