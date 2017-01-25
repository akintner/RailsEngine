class Customer < ApplicationRecord
  def self.find_by_params(param)
    if param["first_name"]
      find_by(first_name: param["first_name"])
    elsif param["id"]
      find_by(id: param["id"].to_i)
    elsif param["last_name"]
      find_by(last_name: param["last_name"])
    elsif param["created_at"]
      find_by(created_at: param["created_at"])
    elsif param["updated_at"]
      find_by(updated_at: param["updated_at"])
    else
      nil
    end     
  end

  def self.where_by_params(param)
     if param["first_name"]
      where(first_name: param["first_name"])
    elsif param["id"]
      where(id: param["id"].to_i)
    elsif param["last_name"]
      where(last_name: param["last_name"])
    elsif param["created_at"]
      where(created_at: param["created_at"])
    elsif param["updated_at"]
      where(updated_at: param["updated_at"])
    else
      nil
    end 
  end
   
end
