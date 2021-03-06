class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope {order("id")}

  def unit_price_dollar
    penny_to_dollar(unit_price)
  end

  def self.find_by_params(param)
    if param["id"]
      find_by(id: param["id"].to_i)
    elsif param["name"]
      find_by(name: param["name"])
    elsif param["description"]
      find_by(description: param["description"])
    elsif param["unit_price"]
      find_by(unit_price: dollar_to_penny(param["unit_price"]))
    elsif param["merchant_id"]
      find_by(merchant_id: param["merchant_id"])
    elsif param["created_at"]
      find_by(created_at: param["created_at"])
    elsif param["updated_at"]
      find_by(updated_at: param["updated_at"])
    else
      nil
    end     
  end

  def self.where_by_params(param)
    if param["id"]
      where(id: param["id"].to_i)
    elsif param["name"]
      where(name: param["name"])
    elsif param["description"]
      where(description: param["description"])
    elsif param["unit_price"]
      where(unit_price: dollar_to_penny(param["unit_price"]))
    elsif param["merchant_id"]
      where(merchant_id: param["merchant_id"])
    elsif param["created_at"]
      where(created_at: param["created_at"])
    elsif param["updated_at"]
      where(updated_at: param["updated_at"])
    else
      nil
    end     
  end

  def best_day
    invoices
    .joins(:invoice_items)
    .group('invoices.id, invoices.created_at')
    .order('sum(invoice_items.quantity) DESC')
    .first
    .created_at
  end

  def self.most_items(quantity)
    unscoped
    .joins([invoices: :transactions])
    .merge(Transaction.successful)
    .group('items.id')
    .order('sum(invoice_items.quantity) DESC')
    .limit(quantity)
  end

  def self.most_revenue(quantity)
    unscoped
    .joins(:invoice_items, invoices: [:transactions])
    .merge(Transaction.successful)
    .group("items.id")
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .limit(quantity)
  end

  def self.random
    order('RANDOM()').first
  end

end