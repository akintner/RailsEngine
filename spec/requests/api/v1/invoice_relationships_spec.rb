require 'rails_helper'

RSpec.describe 'Invoices Relationships' do
  it 'can find all transactions for invoice' do
    invoice = create(:invoice)
    transactions = create_list(:transaction, 4)
    invoice.transactions << transactions
    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(invoice.transactions.count)
  end

  it 'can find all invoice_items for invoice' do
    invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 4)
    invoice.invoice_items << invoice_items   
    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(invoice.invoice_items.count)
  end

  it 'can find all items for invoice' do
    invoice = create(:invoice)
    items = create_list(:item, 7)
    invoice.items << items    
    get "/api/v1/invoices/#{invoice.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(invoice.items.count)
  end

  it 'can find customer for invoice' do
    invoice = create(:invoice)
    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(invoice.customer_id)
  end

  it 'can find merchant for invoice' do
    invoice = create(:invoice)
    get "/api/v1/invoices/#{invoice.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(invoice.merchant_id)
  end

endnd

end