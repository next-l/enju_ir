require 'rails_helper'

RSpec.describe "enju_ir/collections/new", type: :view do
  fixtures :all

  before(:each) do
    assign(:collection, EnjuIr::Collection.new(
      title: "test",
      user: nil
    ))
  end

  it "renders new collection form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.collections_path, "post" do

      assert_select "input[name=?]", "collection[title]"
    end
  end
end
