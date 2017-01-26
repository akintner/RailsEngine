require 'rails_helper'

RSpec.describe 'Items Business Intelligence' do
  xit 'can find best day of sales for an item' do
    #returns the date with the most sales for the given item using the invoice date. 
    #If there are multiple days with equal number of sales, return the most recent day.
    item = create(:item)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
    create(:invoice_item, item: item, invoice: invoice_1, quantity: 70)
    create(:invoice_item, item: item, invoice: invoice_2, quantity: 110)
    create(:invoice_item, item: item, invoice: invoice_3, quantity: 9)

    get "/api/v1/items/#{item.id}/best_day"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(1)
    expect(result["invoice_id"]).to eq(invoice_2.id)
  end

  xit 'can find top item sold' do
    #returns the top x item instances ranked by total number sold
    item = create(:item)
    get "/api/v1/items/most_items?quantity=x"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end
end