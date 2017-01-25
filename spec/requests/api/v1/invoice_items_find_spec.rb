require 'rails_helper'

RSpec.describe 'Invoice items API Find Controller' do
  it 'can find an invoice item by id' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find?id=#{test_invoice_items.first['id']}"

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

  it 'can find an invoice item by item id' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find?item_id=#{test_invoice_items.first['item_id']}"

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

  it 'can find an invoice item by invoice id' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find?invoice_id=#{test_invoice_items.first['invoice_id']}"

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

  it 'can find an invoice item by quantity' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find?quantity=#{test_invoice_items.first['quantity']}"

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

  it 'can find an invoice item by unit_price' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find?unit_price=0.01"

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