require 'rails_helper'

RSpec.describe 'Items API' do
  it 'can find all items' do
    create_list(:item, 3)
    get '/api/v1/items'

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
    expect(item['unit_price']).to be_a(Float)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end

  it 'can find a specific item' do
    test_items = create_list(:item, 3)
    get "/api/v1/items/#{test_items.first['id']}"

    item = JSON.parse(response.body)
byebug
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
    expect(item['unit_price']).to be_a(Float)
    expect(item).to have_key('merchant_id')
    expect(item['merchant_id']).to be_a(Integer)
    expect(item).to have_key('created_at')
    expect(item).to have_key('updated_at')
  end
end