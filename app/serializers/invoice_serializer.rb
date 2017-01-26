class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status 

  # belongs_to :merchant 
  # belongs_to :customer

  # has_many :transactions
  # has_many :invoice_items
  # has_many :items, through: :invoice_items

  def format_transactions
    object.transactions.select(:id)
  end

  def format_invoice_items
    object.invoice_items.select(:id)
  end

  def format_items
    object.items.select(:id)
  end
end
