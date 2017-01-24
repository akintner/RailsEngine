require 'rails_helper'

RSpec.describe "Customers API Find All" do
  xit "can find all customers by search params" do 
    create_list(:customer, 3)

    expect(response).to be_success
    expect(customer).to have_key("first_name")
    expect(customer["first_name"]).to be_a(String)
  end
end