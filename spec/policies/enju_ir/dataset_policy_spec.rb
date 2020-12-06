require 'rails_helper'

RSpec.describe EnjuIr::DatasetPolicy, type: :policy do
  let(:user) { User.new }
  fixtures :all

  subject { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    it "allows access if dataset is depositor's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).to permit(dataset.user, dataset)
    end

    it "allows access if dataset is another user's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).to permit(users(:user1), dataset)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    it "allows access if dataset is depositor's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).to permit(dataset.user, dataset)
    end

    it "denies access if dataset is another user's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).not_to permit(users(:user1), dataset)
    end
  end

  permissions :destroy? do
    it "allows access if dataset is depositor's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).to permit(dataset.user, dataset)
    end

    it "denies access if dataset is another user's" do
      dataset = FactoryBot.create(:dataset)
      expect(subject).not_to permit(users(:user1), dataset)
    end
  end
end
