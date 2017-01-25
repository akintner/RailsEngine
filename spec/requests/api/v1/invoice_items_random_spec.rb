require 'rails_helper'

RSpec.describe 'Invoice items API Random Controller' do
  it 'can return an invoice item' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/random"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key('id')
    expect(invoice_item['id']).to be_a(Integer)
    expect(invoice_item).to have_key('item_id')
    expect(invoice_item['item_id']).to be_a(Integer)
    expect(invoice_item).to have_key('invoice_id')
    expect(invoice_item['invoice_id']).to be_a(Integer)
    expect(invoice_item).to have_key('quantity')
    expect(invoice_item['quantity']).to be_a(Integer)
    expect(invoice_item).to have_key('unit_price')
    expect(invoice_item['unit_price']).to be_a(String)
    expect(invoice_item).to have_key('created_at')
    expect(invoice_item).to have_key('updated_at')
  end

end