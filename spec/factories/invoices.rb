FactoryGirl.define do
  factory :invoice do
    before(:create) do |merchant, customer|
        create(:merchant)
        create(:customer)
    end
    customer_id 1
    merchant_id 1
    status "WhatIsTheStatus"
    created_at "2017-01-23 23:36:38"
    updated_at "2017-01-23 23:36:38"
    
  end
end
