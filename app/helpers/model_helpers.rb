module ModelHelpers
  PENNIES_PER_DOLLAR = 100

  def penny_to_dollar(input)
    input.to_f/PENNIES_PER_DOLLAR
  end
end