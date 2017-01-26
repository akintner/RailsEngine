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
    customer = create(:customer)
    transactions = create_list(:transaction, 2)
    customer.transactions << transactions
    get "/api/v1/customers/#{customer.id}/transactions"

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(customer.transactions.count)
  end
end