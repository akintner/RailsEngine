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
end