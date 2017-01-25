class ItemSerializer < ActiveModel::Serializer
  include ModelHelpers

  attributes :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :format_invoice_items

  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  
  def unit_price
    penny_to_dollar(object.unit_price).to_s
  end

  def format_invoice_items
    object.invoice_items.each do |i_item|
      i_item.id
    end
  end
end
