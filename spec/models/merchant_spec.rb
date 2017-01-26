require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'associations' do
    it {should respond_to(:items)}
    it {should respond_to(:invoices)}
    it {should respond_to(:customers)}
    it {should respond_to(:transactions)}
    it {should respond_to(:invoice_items)}
    describe 'invoices' do
      it 'can return only invoices associated this merchant' do
        merchants = create_list(:merchant, 2)
        invoices = create_list(:invoice, 5)
        test_merchant = merchants.first
        test_invoice1 = invoices[0]
        test_invoice2 = invoices[2]
        test_merchant.invoices << [test_invoice1, test_invoice2]

        test_merchant_invoices = test_merchant.invoices

        expect(test_merchant_invoices.count).to eq(2)
        expect(test_merchant_invoices.include?(test_invoice1)).to be_truthy
        expect(test_merchant_invoices.include?(test_invoice2)).to be_truthy
      end
    end
    describe 'items' do
      it 'can return only items associated this merchant' do
        merchants = create_list(:merchant, 2)
        items = create_list(:item, 5)
        test_merchant = merchants.first
        test_item1 = items[0]
        test_item2 = items[2]
        test_merchant.items << [test_item1, test_item2]

        test_merchant_items = test_merchant.items

        expect(test_merchant_items.count).to eq(2)
        expect(test_merchant_items.include?(test_item1)).to be_truthy
        expect(test_merchant_items.include?(test_item2)).to be_truthy
      end
    end
  end

  describe 'validations' do
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

    it 'can return a random merchant' do
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

  describe 'Business Intelligence' do
    before do
      @test_invoices = create_list(:invoice, 3)
      @test_transactions = create_list(:transaction, 3)
      @test_transactions[0].invoice = @test_invoices[0]
      @test_transactions[0].save
      @test_transactions[1].invoice = @test_invoices[1]
      @test_transactions[1].save
      @test_transactions[2].invoice = @test_invoices[2]
      @test_transactions[2].save
      @merchant_top1 = Merchant.first
      @merchant_top2 = Merchant.last
      @merchant_top1.invoices << [@test_invoices[0], @test_invoices[1]]
      @merchant_top2.invoices << @test_invoices[2]
      test_item = create(:item)
      InvoiceItem.create(quantity: 1, unit_price: 1, item: test_item, invoice: @test_invoices[0])
      InvoiceItem.create(quantity: 1, unit_price: 1, item: test_item, invoice: @test_invoices[1])
      InvoiceItem.create(quantity: 1, unit_price: 1, item: test_item, invoice: @test_invoices[2])
    end
    it 'can return the top 1 merchants by revenue' do
      top_merchants = Merchant.top_x_by_revenue(1)

      expect(top_merchants.first.id).to eq(@merchant_top1.id)
    end
    it 'can return the top 2 merchants by revenue' do
      top_merchants = Merchant.top_x_by_revenue(2)

      expect(top_merchants.first.id).to eq(@merchant_top1.id)
      expect(top_merchants.last.id).to eq(@merchant_top2.id)
    end
    it 'can return the top 1 merchants by number of items sold' do
      top_merchants = Merchant.most_items_sold(1)

      expect(top_merchants.first.id).to eq(@merchant_top1.id)
    end
    it 'can return the top 2 merchants by number of items sold' do
      top_merchants = Merchant.most_items_sold(2)

      expect(top_merchants.first.id).to eq(@merchant_top1.id)
      expect(top_merchants.last.id).to eq(@merchant_top2.id)
    end
  end
end
