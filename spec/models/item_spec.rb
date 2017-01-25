require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "associations" do 
    it {should respond_to(:merchant) }
    it {should respond_to :invoice_items}
    it {should respond_to :invoices}
  end
end
