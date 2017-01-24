class Transaction < ApplicationRecord
  # belongs_to :invoice
  def self.find_by_params(param)
    if param["result"]
      find_by(result: param["result"])
    elsif param["id"]
      find_by(id: param["id"].to_i)
    elsif param["credit_card_number"]
      find_by(credit_card_number: param["credit_card_number"])
    elsif param["created_at"]
      find_by(created_at: param["created_at"])
    elsif param["updated_at"]
      find_by(updated_at: param["updated_at"])
    else
      nil
    end     
  end
end
