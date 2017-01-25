require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validation' do
    it 'can create Customer with all attributes, including timestamps from CSVs' do
      test_customer = Customer.create(first_name: 'FirstName',
                                      last_name: 'LastName',
                                      created_at: '2017-01-24 00:10:51',
                                      updated_at: '2017-01-24 00:10:51')

      expect(test_customer).to be_valid
      expect(Customer.count).to eq(1)
      expect(Customer.first).to eq(test_customer)
    end
  end
  describe 'methods' do
    xit 'can return a random customer' do
    end
  end
end
