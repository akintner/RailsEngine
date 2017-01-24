FactoryGirl.define do
  factory :invoice do
    customer_id 1
    merchant_id 1
    status "WhatIsTheStatus"
    created_at "2017-01-23 23:36:38"
    updated_at "2017-01-23 23:36:38"
  end
end
