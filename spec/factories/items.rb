FactoryGirl.define do
  factory :item do
    merchant
    name "ThisItem"
    description "What is this item"
    unit_price 1
    created_at "2017-01-23 23:54:17"
    updated_at "2017-01-23 23:54:17"
  end
end
