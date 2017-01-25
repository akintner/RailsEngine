require 'rails_helper'

RSpec.describe 'Invoices API Find Controller' do
  it 'can find an invoice by id' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find?id=#{test_invoices.first['id']}"

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

  it 'can find an invoice by customer id' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find?customer_id=#{test_invoices.first['customer_id']}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
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

  it 'can find an invoice by merchant id' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find?merchant_id=#{test_invoices.first['merchant_id']}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
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

  it 'can find an invoice by status' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find?status=#{test_invoices.first['status']}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
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

end