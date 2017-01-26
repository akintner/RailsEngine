require 'rails_helper'

RSpec.describe 'Merchants Relationships' do
  it 'can find associated invoices for Merchant' do
    merchant = create(:merchant)
    invoices = create_list(:invoice, 2)
    merchant.invoices << invoices
    get "/api/v1/merchants/#{merchant.id}/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(merchant.invoices.count)
  end

  it 'can find associated items for merchant' do
    merchant = create(:merchant)
    items = create_list(:item, 2)
    merchant.items << items
    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(merchant.items.count)
  end
end