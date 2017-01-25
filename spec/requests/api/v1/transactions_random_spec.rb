require 'rails_helper'

RSpec.describe "Transactions API Random Controller" do
  it "can return a transaction" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/random'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

end