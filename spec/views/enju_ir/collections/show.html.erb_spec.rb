require 'rails_helper'

RSpec.describe "enju_ir/collections/show", type: :view do
  fixtures :all

  before(:each) do
    @collection = assign(:collection, EnjuIr::Collection.create!(
      title: "test",
      user: users(:user1)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
