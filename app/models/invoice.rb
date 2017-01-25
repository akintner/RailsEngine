class Invoice < ApplicationRecord

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
end
