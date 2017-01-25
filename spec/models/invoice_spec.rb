require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "associations" do
    it {should respond_to :customer}
    it {should respond_to :merchant}
  end
end
