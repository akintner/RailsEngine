FactoryGirl.define do
  factory :invoice do
    merchant 
    customer 
    status "WhatIsTheStatus"
    created_at "2017-01-23 23:36:38"
    updated_at "2017-01-23 23:36:38"
  end
end
