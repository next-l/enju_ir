require 'rails_helper'

RSpec.describe "enju_ir/datasets/edit", type: :view do
  fixtures :all

  before(:each) do
    @dataset = assign(:dataset, FactoryBot.create(:dataset))
  end

  it "renders the edit dataset form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.dataset_path(@dataset), "post" do
    end
  end
end
