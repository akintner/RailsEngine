require 'rails_helper'

RSpec.describe 'Items Business Intelligence' do
  it 'can find best day of sales for an item' do
    #returns the date with the most sales for the given item using the invoice date. 
    #If there are multiple days with equal number of sales, return the most recent day.
    item = create(:item)
    get "/api/v1/items/#{item.id}/best_day"

    result = JSON.parse(response.body)

    expect(response).to be_success
  end

  xit 'can find top item sold' do
    #returns the top x item instances ranked by total number sold
    item = create(:item)
    get "/api/v1/items/most_items?quantity=x"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end
end