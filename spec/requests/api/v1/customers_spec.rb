require 'rails_helper'

RSpec.describe "Customers API" do
  it "can find all customers" do 
    create_list(:customer, 3)
    get "/api/v1/customers" 

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customer).to be_a(Hash)
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer).to have_key("created_at")
    expect(customer["last_name"]).to be_a(String)
    expect(customer["id"]).to be_a(Integer)
  end
end