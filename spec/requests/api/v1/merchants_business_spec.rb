require 'rails_helper'

RSpec.describe 'Merchants Business Intelligence' do
  it 'can find total revenue for each merchant' do
    #returns the total revenue for that merchant across all transactions
    merchant = create(:merchant)
    item = create(:item)
    invoice = create(:invoice, merchant: merchant)
    invoice_2 = create(:invoice, merchant: merchant)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice, quantity: 7, unit_price: 53000)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_2, quantity: 5, unit_price: 70000)
    transaction = create(:transaction, invoice: invoice, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "success")

    revenue_1 = (invoice_item_1.quantity * invoice_item_1.unit_price) 
    revenue_2 = (invoice_item_2.quantity * invoice_item_2.unit_price) 

    revenue = ((revenue_1 + revenue_2) /100.00).to_s

    get "/api/v1/merchants/#{merchant.id}/revenue"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["revenue"]).to eq(revenue)
  end

  it "will return total revenue only for successful transactions" do
    merchant = create(:merchant)
    item = create(:item)
    invoice = create(:invoice, merchant: merchant)
    invoice_2 = create(:invoice, merchant: merchant)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice, quantity: 10, unit_price: 35000)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_2, quantity: 5, unit_price: 40000)
    transaction = create(:transaction, invoice: invoice, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "failure")

    revenue = ((invoice_item_1.quantity * invoice_item_1.unit_price)/ 100.00).to_s

    get "/api/v1/merchants/#{merchant.id}/revenue"
    result = JSON.parse(response.body)
    expect(response).to be_success
    expect(result["revenue"]).to eq(revenue)
  end

  it 'can find total revenue for specified date' do
    #returns the total revenue for that merchant for a specific invoice date x
    date = "2016-09-06 12:00:35"
    merchant = create(:merchant)
    item = create(:item)
    invoice = create(:invoice, merchant: merchant, created_at: date)
    invoice_2 = create(:invoice, merchant: merchant, created_at: date)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice, quantity: 10, unit_price: 50000)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_2, quantity: 5, unit_price: 10000)
    transaction = create(:transaction, invoice: invoice, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "failure")

    revenue = ((invoice_item_1.quantity * invoice_item_1.unit_price)/ 100.00).to_s

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["revenue"]).to eq(revenue)
  end

  it 'can find top merchants ranked by items sold' do
    #returns the top x merchants ranked by total number of items sold
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item)
    item2 = create(:item)
    invoice = create(:invoice, merchant: merchant1)
    invoice_2 = create(:invoice, merchant: merchant2)
    invoice_items_1 = create(:invoice_item, item: item1, invoice: invoice, quantity: 3, unit_price: 99000)
    invoice_items_2 = create(:invoice_item, item: item2, invoice: invoice_2, quantity: 17, unit_price: 1000)
    transaction = create(:transaction, invoice: invoice, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "success")

    get "/api/v1/merchants/most_items?quantity=2"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.first["id"]).to eq(merchant2.id)
  end

  it 'can return top x number of merchants based on total revenue' do
    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body)
byebug
    expect(response).to be_success
  end

end