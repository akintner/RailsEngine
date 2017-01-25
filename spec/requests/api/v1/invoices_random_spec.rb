require 'rails_helper'

RSpec.describe 'Invoices API Random Controller' do
  it 'can return an invoice' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/random"

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