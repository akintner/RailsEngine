require 'rails_helper'

RSpec.describe "Customers API Find Controller" do
  it "can find a customer by first_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find?first_name=Prof. Severus'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to be_a(String)
  end

  it "can find a customer by last_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find?last_name=Snape'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to be_a(String)
  end

  it "can find a customer by id" do 
    customers = create_list(:customer, 3)
    get "/api/v1/customers/find?id=#{customers.first.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to be_a(String)
  end
end