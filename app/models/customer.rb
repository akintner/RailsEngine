class Customer < ApplicationRecord

  def to_param
    first_name
  end

  def self.find(input)
    input.to_i == 0 ? find_by_name(input) : super
  end
end
