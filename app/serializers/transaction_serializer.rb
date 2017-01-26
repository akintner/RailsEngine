class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :result, :invoice_id
end
