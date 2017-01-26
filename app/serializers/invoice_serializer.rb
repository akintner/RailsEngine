class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :format_transactions, :format_items, :format_invoice_items

  belongs_to :merchant 
  belongs_to :customer

  # has_many :transactions
  # has_many :invoice_items
  # has_many :items, through: :invoice_items

  def format_transactions
    # object.transactions.each do |transaction|
    #   transaction.id
    # end
    object.transactions.select(:id)
  end

  def format_invoice_items
    # object.invoice_items.each do |i_item|
    #   i_item.id
    # end
    object.invoice_items.select(:id)
  end

  def format_items
    # object.items.each do |item|
    #   item.id
    # end
    object.items.select(:id)
  end
end
