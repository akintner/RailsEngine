require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validation' do
    it 'can create Merchant with all attributes, including timestamps from CSVs' do
      test_merchant = Merchant.create(name: 'Merchant Name',
                                      created_at: '2017-01-24 00:10:51',
                                      updated_at: '2017-01-24 00:10:51')

      expect(test_merchant).to be_valid
      expect(Merchant.count).to eq(1)
      expect(Merchant.first).to eq(test_merchant)
    end
  end
  
  describe 'methods' do
    it 'can find the first match based on any attribute' do
      test_merchants = create_list(:merchant, 3)
      test_params = {"name" => "Hogwarts Express Railways"}

      find_merchant = Merchant.find_by_params(test_params)

      expect(find_merchant.id).to eq(test_merchants.first.id)
    end

    it 'can find all matches based on any attribute' do
      test_merchants = create_list(:merchant, 3)
      test_merchants[0].update(name: 'Hogwarts Express Railways')
      test_merchants[1].update(name: 'SomethingElse')
      test_merchants[2].update(name: 'Hogwarts Express Railways')
      test_params = {"name" => "Hogwarts Express Railways"}

      find_merchants = Merchant.where_by_params(test_params)

      expect(find_merchants.count).to eq(2)
    end

    xit 'can return a random merchant' do
      create_list(:merchant, 100)

      random_merchant1 = Merchant.random
      random_merchant2 = Merchant.random

      retry_count = 0
      while random_merchant1.id.eql?(random_merchant2.id) && retry_count < 5
        retry_count =+ 1
        random_merchant2 = Merchant.random
      end

      expect(random_merchant1.id.eql?(random_merchant2.id)).to be_falsy
    end

  end
end
