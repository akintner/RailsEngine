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
    order('RANDOM()').first
  end

  def favorite_customer
    customers
    .select("customers.*, count(transactions.id) as transactions_count")
    .joins(invoices: :transactions)
    .merge(Transaction.successful)
    .group("customers.id")
    .order("transactions_count DESC")
    .first
  end

  def total_revenue(date)
    find_invoices(date)
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.top_x_by_revenue(top_x)
    select(:id, :name, "SUM(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("total_revenue DESC")
    .limit(top_x.to_i)
  end

  def self.total_revenue_by_date(date)
    Invoice.where(created_at: date).joins(:invoice_items, :transactions).group(:id).sum('invoice_items.quantity * invoice_items.unit_price')
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
