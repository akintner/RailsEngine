require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe 'associations' do
    it {should respond_to(:invoice)}
    it {should respond_to(:invoice_items)}
  end

  describe 'validations' do
    it 'can create Transaction with all attributes, including timestamps from CSVs' do
      test_transaction = create(:transaction)

      expect(test_transaction).to be_valid
      expect(Transaction.count).to eq(1)
      expect(Transaction.first).to eq(test_transaction)
    end
  end
  
  describe 'methods' do
    describe 'find the first match based on any attribute' do
      before do
        test_transactions = create_list(:transaction, 3)
      end
      it 'can find based on result' do
        test_params = {"result" => "success"}

        find_transaction = Transaction.find_by_params(test_params)

        expect(find_transaction.id).to eq(Transaction.first.id)
      end
      it 'can find based on created_at' do
        test_params = {"created_at" => "2017-01-23 23:54:17"}

        find_transaction = Transaction.find_by_params(test_params)

        expect(find_transaction.id).to eq(Transaction.first.id)
      end
      it 'can find based on updated_at' do
        test_params = {"updated_at" => "2017-01-23 23:54:17"}

        find_transaction = Transaction.find_by_params(test_params)

        expect(find_transaction.id).to eq(Transaction.first.id)
      end
    end


    describe 'can find all matches based on any attribute' do
      before do
        test_transactions = create_list(:transaction, 3)
        test_transactions[0].update(result: 'success')
        test_transactions[1].update(result: 'SomethingElse')
        test_transactions[2].update(result: 'success')
      end
      it 'can find based on result' do
        test_params = {"result" => "success"}

        find_transactions = Transaction.where_by_params(test_params)

        expect(find_transactions.count).to eq(2)
      end
      it 'can find based on created_at' do
        test_params = {"created_at" => "2017-01-23 23:54:17"}

        find_transactions = Transaction.where_by_params(test_params)

        expect(find_transactions.count).to eq(3)
      end
      it 'can find based on updated_at' do
        test_params = {"updated_at" => "2017-01-23 23:54:17"}

        find_transactions = Transaction.where_by_params(test_params)

        expect(find_transactions.count).to eq(2)
      end
    end


    it 'can return a random transaction' do
      create_list(:transaction, 100)

      random_transaction1 = Transaction.random
      random_transaction2 = Transaction.random

      retry_count = 0
      while random_transaction1.id.eql?(random_transaction2.id) && retry_count < 5
        retry_count =+ 1
        random_transaction2 = Transaction.random
      end

      expect(random_transaction1.id.eql?(random_transaction2.id)).to be_falsy
    end

  end
end
