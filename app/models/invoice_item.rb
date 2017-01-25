class InvoiceItem < ApplicationRecord
  def self.find_by_params(param)
    if param["id"]
      find_by(id: param["id"].to_i)
    elsif param["item_id"]
      find_by(item_id: param["item_id"])
    elsif param["invoice_id"]
      find_by(invoice_id: param["invoice_id"])
    elsif param["quantity"]
      find_by(quantity: param["quantity"])
    elsif param["unit_price"]
      find_by(unit_price: dollar_to_penny(param["unit_price"]))
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
    elsif param["item_id"]
      where(item_id: param["item_id"])
    elsif param["invoice_id"]
      where(invoice_id: param["invoice_id"])
    elsif param["quantity"]
      where(quantity: param["quantity"])
    elsif param["unit_price"]
      where(unit_price: dollar_to_penny(param["unit_price"]))
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

end
