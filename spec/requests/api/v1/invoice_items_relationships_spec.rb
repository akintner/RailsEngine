require 'rails_helper'

RSpec.describe 'Invoice_items Relationships' do
  it 'can find associated invoice for invoice item' do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice_item.invoice_id)
  end

  it 'can find associated item for invoice item' do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(invoice_item.item_id)
  end
end