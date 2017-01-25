require 'rails_helper'

RSpec.describe "Merchants API" do
  it "can find all merchants" do 
    create_list(:merchant, 3)
    get "/api/v1/merchants" 

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant).to have_key("created_at")
    expect(merchant["name"]).to be_a(String)
    expect(merchant["id"]).to be_a(Integer)
  end

  it "can show one merchants" do 
    test_merchants = create_list(:merchant, 3)
    get "/api/v1/merchants/#{test_merchants.first['id']}" 

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant['id']).to eq(test_merchants.first['id'])
    expect(merchant).to have_key("name")
    expect(merchant).to have_key("created_at")
    expect(merchant["name"]).to be_a(String)
    expect(merchant["id"]).to be_a(Integer)
  end
end