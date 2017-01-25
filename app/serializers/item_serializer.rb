class ItemSerializer < ActiveModel::Serializer
  include ModelHelpers

  attributes :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def unit_price
    penny_to_dollar(object.unit_price).to_s
  end
end
