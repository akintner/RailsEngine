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
      find_by(unit_price: param["unit_price"])
    elsif param["created_at"]
      find_by(created_at: param["created_at"])
    elsif param["updated_at"]
      find_by(updated_at: param["updated_at"])
    else
      nil
    end     
  end
end
