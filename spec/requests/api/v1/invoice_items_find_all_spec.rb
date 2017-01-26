require 'rails_helper'

RSpec.describe 'Invoice items API Find_All Controller' do
  it 'can find all invoice item by id' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find_all?id=#{test_invoice_items.first['id']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
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
  end

  it 'can find all invoice item by item id' do
    test_invoice_items = create_list(:invoice_item, 3)
    test_invoice_items[0].update(item: Item.first)
    test_invoice_items[1].update(item: Item.last)
    test_invoice_items[2].update(item: Item.first)
    get "/api/v1/invoice_items/find_all?item_id=#{test_invoice_items.first['item_id']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
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
  end

  it 'can find all invoice item by invoice id' do
    test_invoice_items = create_list(:invoice_item, 3)
    test_invoice_items[0].update(invoice: Invoice.first)
    test_invoice_items[1].update(invoice: Invoice.last)
    test_invoice_items[2].update(invoice: Invoice.first)
    get "/api/v1/invoice_items/find_all?invoice_id=#{test_invoice_items.first['invoice_id']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
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
  end

  it 'can find all invoice item by quantity' do
    test_invoice_items = create_list(:invoice_item, 3)
    test_invoice_items[0].update(quantity: 1)
    test_invoice_items[1].update(quantity: 2)
    test_invoice_items[2].update(quantity: 1)
    get "/api/v1/invoice_items/find_all?quantity=#{test_invoice_items.first['quantity']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
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
  end

  it 'can find all invoice item by unit price' do
    test_invoice_items = create_list(:invoice_item, 3)
    test_invoice_items[0].update(unit_price: 101)
    test_invoice_items[1].update(unit_price: 200)
    test_invoice_items[2].update(unit_price: 101)
    get "/api/v1/invoice_items/find_all?unit_price=1.01"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
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
  end

  it 'can find all invoice item by created at date' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find_all?created_at=#{test_invoice_items.first['created_at']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
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
  end

  it 'can find all invoice item by updated at date' do
    test_invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/find_all?updated_at=#{test_invoice_items.first['updated_at']}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
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
  end

end