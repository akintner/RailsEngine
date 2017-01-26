require 'rails_helper'

RSpec.describe "Transactions API Find Controller" do
  it "can find a transaction by result" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find?result=success'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

  it "can find a transaction by id" do 
    transactions = create_list(:transaction, 3)
    get "/api/v1/transactions/find?id=#{transactions.first.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction["id"]).to eq(transactions.first.id)
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

  it "can find a transaction by credit_card_number" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find?credit_card_number=4654405418249632'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

  it "can find a transaction by invoice id" do 
    test_transactions = create_list(:transaction, 3)
    get "/api/v1/transactions/find?invoice_id=#{test_transactions.first.invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

end