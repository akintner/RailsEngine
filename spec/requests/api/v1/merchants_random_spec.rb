require 'rails_helper'

RSpec.describe "Merchants API Random Controller" do
  it "can find a merchant by name" do 
    create_list(:merchant, 3)
    get '/api/v1/merchants/random'

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to be_a(String)
  end

end