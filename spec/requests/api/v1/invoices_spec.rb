require 'rails_helper'

RSpec.describe 'Invoices API' do
  it 'can find all invoices' do
    create_list(:invoice, 3)
    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = Invoices.first

    expect(response).to be_sucess
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice).to have_key('customer_id')
    expect(invoice).to have_key('merchant_id')
    expect(invoice).to have_key('status')
    expect(invoice).to have_key('created_at')
    expect(invoice).to have_key('updated_at')
  end
end