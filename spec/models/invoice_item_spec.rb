require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'associations' do 
    it {should respond_to(:item) }
    it {should respond_to(:invoice) }
    it {should respond_to(:customers)}
    it {should respond_to(:merchants)}
  end
  
  describe 'validations' do
    it 'can create Invoice Item with all attributes, including timestamps from CSVs' do
      test_invoice_item = InvoiceItem.create(item_id: 1,
                                      invoice_id: 2,
                                      quantity: 3,
                                      unit_price: 4,
                                      created_at: '2017-01-24 00:10:51',
                                      updated_at: '2017-01-24 00:10:51')

      expect(test_invoice_item).to be_valid
      expect(InvoiceItem.count).to eq(1)
      expect(InvoiceItem.first).to eq(test_invoice_item)
    end
  end

  describe 'methods' do

    it 'can find the first match based on any attribute' do
      test_invoice_items = create_list(:invoice_item, 3)
      test_params = {"unit_price" => "0.01"}

      find_invoice_item = InvoiceItem.find_by_params(test_params)

      expect(find_invoice_item.id).to eq(test_invoice_items.first.id)
    end

    it 'can find all matches based on any attribute' do
      test_invoice_items = create_list(:invoice_item, 3)
      test_invoice_items[0].update(unit_price: 101)
      test_invoice_items[1].update(unit_price: 200)
      test_invoice_items[2].update(unit_price: 101)
      test_params = {"unit_price" => "1.01"}

      find_invoice_items = InvoiceItem.where_by_params(test_params)

      expect(find_invoice_items.count).to eq(2)
    end

    it 'can return a random invoice item' do
      create_list(:invoice_item, 100)

      random_invoice_item1 = InvoiceItem.random
      random_invoice_item2 = InvoiceItem.random

      retry_count = 0
      while random_invoice_item1.id.eql?(random_invoice_item2) && retry_count < 5
        retry_count =+ 1
        random_invoice_item2 = InvoiceItem.random
      end

      expect(random_invoice_item1.id.eql?(random_invoice_item2.id)).to be_falsy
    end
  end

end
