require 'rails_helper'

RSpec.describe 'Customers Relationships' do
  it 'can find associated invoices for Customer' do
    customer = create(:customer)
    invoices = create_list(:invoice, 2)
    customer.invoices << invoices
    get "/api/v1/customers/#{customer.id}/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(customer.invoices.count)
  end

  it 'can find associated transactions for Customer' do
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

    get "/api/v1/customers/#{test_customer.id}/transactions"

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(test_customer.transactions.count)
  end
end