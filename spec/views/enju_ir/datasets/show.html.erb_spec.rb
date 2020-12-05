require 'rails_helper'

RSpec.describe "enju_ir/datasets/show", type: :view do
  before(:each) do
    @dataset = assign(:dataset, FactoryBot.create(:dataset))
  end

  it "renders attributes in <p>" do
    render
  end
end
