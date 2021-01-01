require 'rails_helper'

module EnjuIr
  RSpec.describe Dataset, type: :model do
    it "should respond to register_doi", vcr: true do
      #allow(ENV).to receive(:[]).with('DATACITE_API_URL').and_return('https://api.test.datacite.org')
      dataset = FactoryBot.create(:dataset)
      expect(dataset.register_doi.body).to be_truthy
    end
  end
end
