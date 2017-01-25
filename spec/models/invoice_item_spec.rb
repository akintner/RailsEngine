require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "associations" do 
    it  {should respond_to(:item) }
    it  {should respond_to(:invoice) }
  end
end
