require 'rails_helper'

RSpec.describe 'Transactions Relationships' do
  it 'can find invoice for transaction' do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(transaction.invoice_id)
  end
end