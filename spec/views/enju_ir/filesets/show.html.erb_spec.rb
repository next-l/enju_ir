require 'rails_helper'

RSpec.describe "enju_ir/filesets/show", type: :view do
  before(:each) do
    @fileset = assign(:fileset, EnjuIr::Fileset.create!(
      enju_ir_dataset: FactoryBot.create(:dataset)
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
