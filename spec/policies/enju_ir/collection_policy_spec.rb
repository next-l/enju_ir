require 'rails_helper'

RSpec.describe EnjuIr::CollectionPolicy, type: :policy do
  let(:user) { User.new }
  fixtures :all

  subject { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    it "allows access if collection is depositor's" do
      collection = FactoryBot.create(:collection)
      expect(subject).to permit(collection.user, collection)
    end

    it "allows access if collection is another user's" do
      collection = FactoryBot.create(:collection)
      expect(subject).to permit(users(:user1), collection)
    end
  end

  permissions :create? do
    it "allows creating a new collection if an user signed in" do
      expect(subject).to permit(users(:user1), EnjuIr::Collection)
    end
  end

  permissions :update? do
    it "allows access if collection is depositor's" do
      collection = FactoryBot.create(:collection)
      expect(subject).to permit(collection.user, collection)
    end

    it "denies access if collection is another user's" do
      collection = FactoryBot.create(:collection)
      expect(subject).not_to permit(users(:user1), collection)
    end
  end

  permissions :destroy? do
    it "allows access if collection is depositor's" do
      collection = FactoryBot.create(:collection)
      expect(subject).to permit(collection.user, collection)
    end

    it "denies access if collection is another user's" do
      collection = FactoryBot.create(:collection)
      expect(subject).not_to permit(users(:user1), collection)
    end
  end
end
