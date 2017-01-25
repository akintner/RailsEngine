require 'rails_helper'

RSpec.describe "Merchants API Find_All Controller" do
  it "can find all merchants by name" do 
    create_list(:merchant, 3)
    get '/api/v1/merchants/find_all?name=Hogwarts Express Railways'

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants).to have_key("id")
    expect(merchants).to have_key("name")
    expect(merchants["name"]).to eq("Hogwarts Express Railways")
  end

  it "can find all merchants by created_at" do 
    create_list(:merchant, 3)
    get "/api/v1/merchants/find_all?created_at"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants).to have_key("id")
    expect(merchants["id"]).to eq(merchantss.first.id)
    expect(merchants).to have_key("name")
    expect(merchants["name"]).to be_a(String)
  end
end