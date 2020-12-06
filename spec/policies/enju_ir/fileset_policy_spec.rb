require 'rails_helper'

RSpec.describe EnjuIr::FilesetPolicy, type: :policy do
  let(:user) { User.new }
  fixtures :all

  subject { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    it "allows access if fileset is depositor's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).to permit(fileset.enju_ir_dataset.user, fileset)
    end

    it "allows access if fileset is another user's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).to permit(users(:user1), fileset)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    it "allows access if fileset is depositor's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).to permit(fileset.enju_ir_dataset.user, fileset)
    end

    it "denies access if fileset is another user's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).not_to permit(users(:user1), fileset)
    end
  end

  permissions :destroy? do
    it "allows access if fileset is depositor's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).to permit(fileset.enju_ir_dataset.user, fileset)
    end

    it "denies access if fileset is another user's" do
      fileset = FactoryBot.create(:fileset)
      expect(subject).not_to permit(users(:user1), fileset)
    end
  end
end
