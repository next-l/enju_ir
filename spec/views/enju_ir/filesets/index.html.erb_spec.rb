require 'rails_helper'

RSpec.describe "enju_ir/filesets/index", type: :view do
  before(:each) do
    assign(:filesets, [
      EnjuIr::Fileset.create!(
        enju_ir_dataset: FactoryBot.create(:dataset)
      ),
      EnjuIr::Fileset.create!(
        enju_ir_dataset: FactoryBot.create(:dataset)
      )
    ])
  end

  it "renders a list of filesets" do
    render
  end
end
