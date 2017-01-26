require 'rails_helper'

RSpec.describe 'Merchants Business Intelligence' do
  xit 'can find total revenue for each merchant' do
    #returns the total revenue for that merchant across all transactions
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
  end

  xit 'can find top item sold' do
    #returns the total revenue for that merchant for a specific invoice date x
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue?date=x"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end

  xit 'can find top merchants ranked by items sold' do
    #returns the top x merchants ranked by total number of items sold
    merchant = create(:merchant)
    get "/api/v1/merchants/most_items?quantity=x"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end
end