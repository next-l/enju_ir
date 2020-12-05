require 'rails_helper'

RSpec.describe "enju_ir/collections/edit", type: :view do
  fixtures :all

  before(:each) do
    @collection = assign(:collection, EnjuIr::Collection.create!(
      title_translations: "",
      user: users(:user1)
    ))
  end

  it "renders the edit collection form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.collection_path(@collection), "post" do

      assert_select "input[name=?]", "collection[title_translations]"

      assert_select "input[name=?]", "collection[user_id]"
    end
  end
end
