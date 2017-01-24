require 'rails_helper'

RSpec.describe "Merchants API Find Controller" do
  it "can find a merchant by name" do 
    create_list(:merchant, 3)
    get '/api/v1/merchants/find?name=Hogwarts Express Railways'

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to be_a(String)
  end

  it "can find a merchant by id" do 
    merchants = create_list(:merchant, 3)
    get "/api/v1/merchants/find?id=#{merchants.first.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant["id"]).to eq(merchants.first.id)
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to be_a(String)
  end

  it "can find a merchant by created_at" do 
    create_list(:merchant, 3)
    get "/api/v1/merchants/find?created_at=#{Date.now}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant).to have_key("created_at")
    expect(merchant["name"]).to be_a(String)
  end
end