class Merchant < ApplicationRecord

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  
  def self.find_by_params(param)
    if param["name"]
      find_by(name: param["name"])
    elsif param["id"]
      find_by(id: param["id"].to_i)
    elsif param["created_at"]
      find_by(created_at: param["created_at"])
    elsif param["updated_at"]
      find_by(updated_at: param["updated_at"])
    else
      nil
    end     
  end

  def self.where_by_params(param)
    if param["name"]
      where(name: param["name"])
    elsif param["id"]
      where(id: param["id"].to_i)
    elsif param["created_at"]
      where(created_at: param["created_at"])
    elsif param["updated_at"]
      where(updated_at: param["updated_at"])
    else
      nil
    end 
  end

  def self.random
    all.shuffle.first
  end

  def total_revenue(date)
    find_invoices(date)
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def find_invoices(date)
    if date
      invoices.where(created_at: date)
    else
      invoices
    end
  end

  def self.most_items_sold(quantity)
    select("merchants.*, sum(invoice_items.quantity) as item_count")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .order("item_count DESC")
    .group("merchants.id")
    .limit(quantity)
  end

end
