class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :result, :created_at, :updated_at
end
