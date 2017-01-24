class Customer < ApplicationRecord

  def to_param
  end

  def self.find_by_param(input)
    find_by_name(input)
  end
end
