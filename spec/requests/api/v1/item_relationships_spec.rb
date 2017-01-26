require 'rails_helper'

RSpec.describe 'Items Relationships' do
  it 'can find all invoice_items for item' do
    item = create(:item)
    invoice_items = create_list(:invoice_item, 4)
    item.invoice_items << invoice_items
    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(item.invoice_items.count)
  end

  it 'can find merchant for item' do
    item = create(:item)
    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(item.merchant_id)
  end
end