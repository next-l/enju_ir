require 'rails_helper'

RSpec.describe "enju_ir/datasets/index", type: :view do
  fixtures :all
  before(:each) do
    assign(:datasets, [
      FactoryBot.create(:dataset),
      FactoryBot.create(:dataset)
    ])
  end

  it "renders a list of datasets" do
    render
  end
end
