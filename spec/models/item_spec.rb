require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "associations" do 
    it {should respond_to(:merchant) }
    it {should respond_to :invoice_items}
    it {should respond_to :invoices}
  end

  describe 'validations' do
    it 'can create Item with all attributes, including timestamps from CSVs' do
      test_item = create(:item)

      expect(test_item).to be_valid
      expect(Item.count).to eq(1)
      expect(Item.first).to eq(test_item)
    end
  end

  describe 'methods' do

    it 'can find the first match based on any attribute' do
      test_items = create_list(:item, 3)
      test_params = {"name" => "ThisItem"}

      find_item = Item.find_by_params(test_params)

      expect(find_item.id).to eq(test_items.first.id)
    end

    it 'can find all matches based on any attribute' do
      test_items = create_list(:item, 3)
      test_items[0].update(description: "test")
      test_items[1].update(description: "awful")
      test_items[2].update(description: "test")
      test_params = {"description" => "test"}

      find_items = Item.where_by_params(test_params)

      expect(find_items.count).to eq(2)
    end

    it 'can return a random item' do
      create_list(:item, 100)

      random_item1 = Item.unscoped.random
      random_item2 = Item.unscoped.random

      retry_count = 0
      while random_item1.id.eql?(random_item2.id) && retry_count < 5
        retry_count =+ 1
        random_item2 = Item.random
      end

      expect(random_item1.id.eql?(random_item2.id)).to be_falsy
    end
  end
end
