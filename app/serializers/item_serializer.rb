class ItemSerializer < ActiveModel::Serializer
  include ModelHelpers

  attributes :id, :name, :description, :merchant_id, :unit_price

  def unit_price
    penny_to_dollar(object.unit_price).to_s
  end

  def format_invoice
    object.invoices.select(:id)
  end

end
