class Merchant < ApplicationRecord
  # validates_uniqueness_of :name
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
end
