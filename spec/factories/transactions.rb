FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "4654405418249632"
    result "success"
    created_at "2017-01-23 23:54:17"
    updated_at "2017-01-23 23:54:17"
  end
end
