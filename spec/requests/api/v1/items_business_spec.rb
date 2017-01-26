require 'rails_helper'

RSpec.describe 'Items Business Intelligence' do
  it 'can find best day of sales for an item' do
    #returns the date with the most sales for the given item using the invoice date. 
    #If there are multiple days with equal number of sales, return the most recent day.
    item = create(:item)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
    create(:invoice_item, item: item, invoice: invoice_1, quantity: 7)
    create(:invoice_item, item: item, invoice: invoice_2, quantity: 11)
    create(:invoice_item, item: item, invoice: invoice_3, quantity: 9)

    get "/api/v1/items/#{item.id}/best_day"
    result = JSON.parse(response.body)

    expect(response).to be_success
  end

  it 'can find top x items by most sold' do
    #returns the top x item instances ranked by total number sold
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
    create(:invoice_item, item: item1, invoice: invoice_1, quantity: 7)
    create(:invoice_item, item: item2, invoice: invoice_2, quantity: 11)
    create(:invoice_item, item: item3, invoice: invoice_3, quantity: 9)

    get "/api/v1/items/most_items?quantity=3"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result).to have_key("item1")
    expect(result).to have_key("item2")
    expect(result).to have_key("item3")
  end

  it 'can find top x items by total revenue generated' do
    # returns the top x items ranked by total revenue generated
    item1 = create(:item)
    item2 = create(:item)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
    invoice_items_1 = create(:invoice_item, item: item1, invoice: invoice_1, quantity: 3, unit_price: 99000)
    invoice_items_2 = create(:invoice_item, item: item2, invoice: invoice_2, quantity: 17, unit_price: 1000)
    invoice_items_3 = create(:invoice_item, item: item2, invoice: invoice_3, quantity: 17, unit_price: 1000)
    transaction = create(:transaction, invoice: invoice_1, result: "success")
    transaction = create(:transaction, invoice: invoice_2, result: "success")
    transaction = create(:transaction, invoice: invoice_3, result: "success")

    get "/api/v1/items/most_revenue?quantity=1"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.first["id"]).to eq(item1.id)
  end
end