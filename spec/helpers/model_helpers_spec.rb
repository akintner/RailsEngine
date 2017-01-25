require 'rails_helper'

RSpec.describe 'Model utility methods' do
  before (:each) do
    class PennyToDollarTest
      include ModelHelpers
    end
    @tester = PennyToDollarTest.new
  end

  describe 'Determine if input has decimal' do
    it 'can return FALSE if no decimal point in input' do
      test_input = '12'

      expect(@tester.has_decimal?(test_input)).to be_falsy
    end
    it 'can return TRUE if no decimal point in input' do
      test_input = '12.1'

      expect(@tester.has_decimal?(test_input)).to be_truthy
    end
  end

  describe 'Penny to dollar amount conversion' do
    it 'can convert zero penny to dollar' do
      dollars = @tester.penny_to_dollar(0)

      expect(dollars).to be_a(Float)
      expect(dollars).to eq(0)
    end
    it 'can convert any non-zero pennies to decimal dollar amount => 1.00' do
      dollars = @tester.penny_to_dollar(100)

      expect(dollars).to be_a(Float)
      expect(dollars).to eq(1.00)
    end
    it 'can convert any non-zero pennies to decimal dollar amount => 2.53' do
      dollars = @tester.penny_to_dollar(253)

      expect(dollars).to be_a(Float)
      expect(dollars).to eq(2.53)
    end
  end
end