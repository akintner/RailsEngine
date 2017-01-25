require 'rails_helper'

RSpec.describe 'Model utility methods' do
  before (:each) do
    class PennyToDollarTest
      include ModelHelpers
    end
    @tester = PennyToDollarTest.new
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