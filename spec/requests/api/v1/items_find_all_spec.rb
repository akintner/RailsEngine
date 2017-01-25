require 'rails_helper'

RSpec.describe 'Items API Find_All Controller' do
  it 'can find an item by id' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find_all?id=#{test_items.first['id']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(1)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by name' do
    test_items = create_list(:item, 3)
    test_items[0].update(name: 'name1')
    test_items[1].update(name: 'name2')
    test_items[2].update(name: 'name1')
    get "/api/v1/items/find_all?name=#{test_items.first['name']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by description' do
    test_items = create_list(:item, 3)
    test_items[0].update(description: 'name1')
    test_items[1].update(description: 'name2')
    test_items[2].update(description: 'name1')
    get "/api/v1/items/find_all?description=#{test_items.first['description']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by unit price' do
    test_items = create_list(:item, 3)
    test_items[0].update(unit_price: 101)
    test_items[1].update(unit_price: 200)
    test_items[2].update(unit_price: 101)
    get "/api/v1/items/find_all?unit_price=1.01"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by merchant id' do
    test_items = create_list(:item, 3)
    test_items[0].update(merchant: Merchant.first)
    test_items[1].update(merchant: Merchant.last)
    test_items[2].update(merchant: Merchant.first)
    get "/api/v1/items/find_all?merchant_id=#{test_items.first['merchant_id']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by created at date' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find_all?created_at=#{test_items.first['created_at']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by updated at date' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find_all?updated_at=#{test_items.first['updated_at']}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(String)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

end