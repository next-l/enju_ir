require 'rails_helper'

RSpec.describe "enju_ir/filesets/show", type: :view do
  before(:each) do
    @fileset = assign(:fileset, FactoryBot.create(:fileset))
  end

  it "renders attributes in <p>" do
    render
  end
end
