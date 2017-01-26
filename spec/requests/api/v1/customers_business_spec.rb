require 'rails_helper'

RSpec.describe 'Customers Business Intelligence' do
  it 'can find favorite merchant' do
    #returns a merchant where the customer has conducted the most successful transactions
    customer = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item = create(:item)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 7, unit_price: 30000)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_2, quantity: 7, unit_price: 30000)
    transaction = create(:transaction, invoice: invoice_1, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "success")

    invoice_3 = create(:invoice, merchant: merchant_2, customer: customer)
    invoice_4 = create(:invoice, merchant: merchant_2, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_3, quantity: 11, unit_price: 50000)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_4, quantity: 11, unit_price: 50000)
    transaction = create(:transaction, invoice: invoice_3, result: "success")
    transaction = create(:transaction, invoice: invoice_4, result: "failed")

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(merchant_1.id)
  end
end