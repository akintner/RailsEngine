require 'rails_helper'

RSpec.describe "Transactions API" do
  it "can find all transactions" do 
    create_list(:transaction, 3)
    get "/api/v1/transactions" 

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("created_at")
    expect(transaction["result"]).to be_a(String)
    expect(transaction["credit_card_number"]).to be_a(Integer)
  end

   it "can find all transactions" do 
    test_transactions = create_list(:transaction, 3)
    get "/api/v1/transactions/#{test_transactions.first['id']}" 

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key("id")
    expect(transaction['id']).to eq(test_transactions.first['id'])
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("created_at")
    expect(transaction["result"]).to be_a(String)
    expect(transaction["credit_card_number"]).to be_a(Integer)
  end
end