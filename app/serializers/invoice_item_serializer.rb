class InvoiceItemSerializer < ActiveModel::Serializer
  include ModelHelpers

  attributes :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  belongs_to :item 
  belongs_to :invoice 

  def unit_price
    penny_to_dollar(object.unit_price).to_s
  end
end
