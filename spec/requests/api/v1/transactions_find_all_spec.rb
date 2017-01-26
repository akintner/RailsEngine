require 'rails_helper'

RSpec.describe "Transactions API Find_All Controller" do
  it "can find transactions by result" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find_all?result=success'

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to eq("success")
  end

  it "can find all transactions by credit_card_number" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find_all?credit_card_number=4654405418249632'

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["credit_card_number"]).to eq("4654405418249632")
  end
  it "can find all transactions by invoice id" do 
    customers = create_list(:customer, 2)
    invoices = create_list(:invoice, 5)
    test_customer = customers.first
    test_invoice1 = invoices[0]
    test_invoice2 = invoices[2]
    test_customer.invoices << [test_invoice1, test_invoice2]
    transactions = create_list(:transaction, 5)
    test_transaction1 = transactions[0]
    test_transaction2 = transactions[2]
    test_invoice1.transactions << test_transaction1
    test_invoice2.transactions << test_transaction2

    test_transactions = create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?invoice_id=#{test_transaction1.invoice_id}"

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(Transaction.where(invoice_id: test_transaction1.invoice_id).count)
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["result"]).to be_a(String)
  end

end