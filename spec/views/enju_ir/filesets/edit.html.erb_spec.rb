require 'rails_helper'

RSpec.describe "enju_ir/filesets/edit", type: :view do
  before(:each) do
    @fileset = assign(:fileset, EnjuIr::Fileset.create!(
      enju_ir_dataset: FactoryBot.create(:dataset)
    ))
  end

  it "renders the edit fileset form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.fileset_path(@fileset), "post" do
    end
  end
end
