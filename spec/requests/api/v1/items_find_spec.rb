require 'rails_helper'

RSpec.describe 'Items API Find Controller' do
  it 'can find an item by id' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?id=#{test_items.first['id']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by name' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?name=#{test_items.first['name']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by description' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?description=#{test_items.first['description']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by unit_price' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?unit_price=#{test_items.first['unit_price']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by merchant_id' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?merchant_id=#{test_items.first['merchant_id']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by created_at' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?created_at=#{test_items.first['created_at']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find an item by updated_at' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/find?updated_at=#{test_items.first['updated_at']}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('id')
    expect(item['id']).to be_a(Integer)
    expect(item['id']).to eq(test_items.first['id'])
    expect(item).to have_key('name')
    expect(item['name']).to be_a(String)
    expect(item).to have_key('description')
    expect(item['description']).to be_a(String)
    expect(item).to have_key('unit_price')
    expect(item['unit_price']).to be_a(Integer)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

end