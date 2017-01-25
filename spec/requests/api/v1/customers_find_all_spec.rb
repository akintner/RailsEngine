require 'rails_helper'

RSpec.describe "Customers API Find_All Controller" do
  it "can find all customers by first_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find_all?first_name=Prof. Severus'
    
    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to have_key("first_name")
    expect(customers).to have_key("last_name")
    expect(customers["first_name"]).to eq("Prof. Severus")
  end

  it "can find all customers by last_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find_all?last_name=Snape'

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to have_key("id")
    expect(customers).to have_key("first_name")
    expect(customers).to have_key("last_name")
    expect(customers["last_name"]).to eq("Snape")
  end
end