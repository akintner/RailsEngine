require 'rails_helper'

RSpec.describe 'Customers Business Intelligence' do
  it 'can find favorite merchant' do
    #returns a merchant where the customer has conducted the most successful transactions
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
  end
end