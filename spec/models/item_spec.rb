require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "associations" do 
    it  { should respond_to(:merchant) }
  end
end
