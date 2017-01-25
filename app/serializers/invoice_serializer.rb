class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  belongs_to :merchant 
  belongs_to :customer

  has_many :invoice_items
  has_many :items, through: :invoice_items
end
