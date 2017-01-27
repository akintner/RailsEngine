class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.find_by_params(param)
    if param["id"]
      find_by(id: param["id"].to_i)
    elsif param["customer_id"]
      find_by(customer_id: param["customer_id"])
    elsif param["merchant_id"]
      find_by(merchant_id: param["merchant_id"])
    elsif param["status"]
      find_by(status: param["status"])
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
    elsif param["customer_id"]
      where(customer_id: param["customer_id"])
    elsif param["merchant_id"]
      where(merchant_id: param["merchant_id"])
    elsif param["status"]
      where(status: param["status"])
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
end
