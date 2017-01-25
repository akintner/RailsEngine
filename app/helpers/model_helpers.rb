module ModelHelpers
  PENNIES_PER_DOLLAR = 100

  def penny_to_dollar(input)
    input.to_f/PENNIES_PER_DOLLAR
  end

  def dollar_to_penny(input)
  end

  def has_decimal?(input)
    return true if input.include?('.')
    false
  end
end