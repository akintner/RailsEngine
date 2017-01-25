require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validation' do
    it 'can create Invoice with all attributes, including timestamps from CSVs' do
      test_invoice= Invoice.create(customer_id: 1,
                                      merchant_id: 2,
                                      status: 'teststatus',
                                      created_at: '2017-01-24 00:10:51',
                                      updated_at: '2017-01-24 00:10:51')

      expect(test_invoice).to be_valid
      expect(Invoice.count).to eq(1)
      expect(Invoice.first).to eq(test_invoice)
    end
  end

  describe 'methods' do

    it 'can find the first match based on any attribute' do
      test_invoices = create_list(:invoice, 3)
      test_params = {"customer_id" => "1"}

      find_invoice = Invoice.find_by_params(test_params)

      expect(find_invoice.id).to eq(test_invoices.first.id)
    end

    it 'can find all matches based on any attribute' do
      test_invoices = create_list(:invoice, 3)
      test_invoices[0].update(customer_id: 1)
      test_invoices[1].update(customer_id: 2)
      test_invoices[2].update(customer_id: 1)
      test_params = {"customer_id" => "1"}

      find_invoices = Invoice.where_by_params(test_params)

      expect(find_invoices.count).to eq(2)
    end

    it 'can return a random invoice' do
      create_list(:invoice, 100)

      random_invoice1 = Invoice.random
      random_invoice2 = Invoice.random

      retry_count = 0
      while random_invoice1.id.eql?(random_invoice2) && retry_count < 5
        retry_count =+ 1
        random_invoice2 = Invoice.random
      end

      expect(random_invoice1.id.eql?(random_invoice2.id)).to be_falsy
    end
  end
end
