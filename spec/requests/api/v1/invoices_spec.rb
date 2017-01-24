require 'rails_helper'

RSpec.describe 'Invoices API' do
  it 'can find all invoices' do
    create_list(:invoice, 3)
    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
    expect(invoice).to have_key('created_at')
    expect(invoice).to have_key('updated_at')
  end

  it 'can find a specific invoice' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/#{test_invoices.first['id']}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice['id']).to eq(test_invoices.first['id'])
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
    expect(invoice).to have_key('created_at')
    expect(invoice).to have_key('updated_at')
  end
end