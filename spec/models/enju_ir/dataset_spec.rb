require 'rails_helper'

module EnjuIr
  RSpec.describe Dataset, type: :model do
    it "should respond to register", vcr: true do
      dataset = FactoryBot.create(:dataset)
      expect(dataset.register.body).to be_truthy
    end

    it "should respond to publish", vcr: true do
      dataset = FactoryBot.create(:dataset)
      expect(dataset.publish.body).to be_truthy
    end

    it "should respond to hide", vcr: true do
      dataset = FactoryBot.create(:dataset)
      expect(dataset.hide.body).to be_truthy
    end

    it "should create a post", vcr: true do
      dataset = FactoryBot.create(:dataset)
      response = dataset.send(:post)
      expect(response.code).to eq '404'
      expect(JSON.parse(response.body)['errors'][0]['title']).to eq "The resource you are looking for doesn't exist."
    end

    it "should create a payload" do
      dataset = FactoryBot.create(:dataset)
      expect(JSON.parse(dataset.send(:payload))['data']['type']).to eq 'dois'
    end
  end
end
