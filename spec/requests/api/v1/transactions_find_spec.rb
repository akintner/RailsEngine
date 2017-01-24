require 'rails_helper'

RSpec.describe "Transactions API Find Controller" do
  it "can find a transaction by name" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find?name=Hogwarts Express Railways'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("name")
    expect(transaction["name"]).to be_a(String)
  end

  it "can find a transaction by id" do 
    transactions = create_list(:transaction, 3)
    get "/api/v1/transactions/find?id=#{transactions.first.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction["id"]).to eq(transactions.first.id)
    expect(transaction).to have_key("name")
    expect(transaction["name"]).to be_a(String)
  end
end