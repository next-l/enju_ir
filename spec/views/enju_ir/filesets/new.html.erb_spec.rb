require 'rails_helper'

RSpec.describe "enju_ir/filesets/new", type: :view do
  before(:each) do
    assign(:fileset, EnjuIr::Fileset.new())
  end

  it "renders new fileset form" do
    render

    assert_select "form[action=?][method=?]", enju_ir.filesets_path, "post" do
    end
  end
end
