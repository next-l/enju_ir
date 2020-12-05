require 'rails_helper'

RSpec.describe "enju_ir/datasets/new", type: :view do
  before(:each) do
    assign(:dataset, EnjuIr::Dataset.new())
  end

  it "renders new dataset form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.datasets_path, "post" do
    end
  end
end
