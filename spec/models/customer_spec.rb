require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it {should respond_to :invoices}
    it {should respond_to :transactions}
    it {should respond_to :invoice_items}
    it {should respond_to :merchants}
    describe 'invoices' do
      it 'can return only invoices associated this customer' do
        customers = create_list(:customer, 2)
        invoices = create_list(:invoice, 5)
        test_customer = customers.first
        test_invoice1 = invoices[0]
        test_invoice2 = invoices[2]
        test_customer.invoices << [test_invoice1, test_invoice2]

        test_customer_invoices = test_customer.invoices

        expect(test_customer_invoices.count).to eq(2)
        expect(test_customer_invoices.include?(test_invoice1)).to be_truthy
        expect(test_customer_invoices.include?(test_invoice2)).to be_truthy
      end
    end
    describe 'transactions' do
      it 'can return only transactions associated this customer' do
        customers = create_list(:customer, 2)
        invoices = create_list(:invoice, 5)
        test_customer = customers.first
        test_invoice1 = invoices[0]
        test_invoice2 = invoices[2]
        test_customer.invoices << [test_invoice1, test_invoice2]
        transactions = create_list(:transaction, 5)
        test_transaction1 = transactions[0]
        test_transaction2 = transactions[2]
        test_invoice1.transactions << test_transaction1
        test_invoice2.transactions << test_transaction2

        test_customer_transactions = test_customer.transactions

        expect(test_customer_transactions.count).to eq(2)
        expect(test_customer_transactions.include?(test_transaction1)).to be_truthy
        expect(test_customer_transactions.include?(test_transaction2)).to be_truthy
      end
    end
  end

  describe 'validations' do
    it 'can create Customer with all attributes, including timestamps from CSVs' do
      test_customer = Customer.create(first_name: 'FirstName',
                                      last_name: 'LastName',
                                      created_at: '2017-01-24 00:10:51',
                                      updated_at: '2017-01-24 00:10:51')

      expect(test_customer).to be_valid
      expect(Customer.count).to eq(1)
      expect(Customer.first).to eq(test_customer)
    end
  end
  
  describe 'methods' do
    describe 'can find the first match based on any attribute' do
      describe 'first_name' do
        it 'can find with case sensitive search' do
          test_customers = create_list(:customer, 3)
          test_params = {"first_name" => "Prof. Severus"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
        it 'can find with NON case sensitive search' do
          test_customers = create_list(:customer, 3)
          test_params = {"first_name" => "prof. severus"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
      end
      describe 'last_name' do
        it 'can find with case sensitive search' do
          test_customers = create_list(:customer, 3)
          test_params = {"last_name" => "Snape"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
        it 'can find with NON case sensitive search' do
          test_customers = create_list(:customer, 3)
          test_params = {"last_name" => "snape"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
      end
      describe 'dates' do
        it 'can find based on created_at' do
          test_customers = create_list(:customer, 3)
          test_params = {"created_at" => "2017-01-23 23:36:38"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
        it 'can find based on updated_at' do
          test_customers = create_list(:customer, 3)
          test_params = {"updated_at" => "2017-01-23 23:36:38"}

          find_customer = Customer.find_by_params(test_params)

          expect(find_customer.id).to eq(test_customers.first.id)
        end
      end

    end

    describe 'find all matches based on any attribute' do
        before do
          test_customers = create_list(:customer, 3)
          test_customers[0].update(first_name: 'First')
          test_customers[1].update(first_name: 'SomethingElse')
          test_customers[2].update(first_name: 'First')
          test_customers[0].update(last_name: 'Last')
          test_customers[1].update(last_name: 'SomethingElse')
          test_customers[2].update(last_name: 'Last')
        end
      describe 'first_name' do

        it 'can find with case sensitive search' do
          test_params = {"first_name" => "First"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(2)
        end

        it 'can find with NON case sensitive search' do
          test_params = {"first_name" => "first"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(2)
        end
      describe 'dates' do
        it 'can find based on created_at' do
          test_customers = create_list(:customer, 3)
          test_params = {"created_at" => "2017-01-23 23:36:38"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(Customer.count)
        end
        it 'can find based on updated_at' do
          test_customers = create_list(:customer, 3)
          test_params = {"updated_at" => "2017-01-23 23:36:38"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(3)
        end
      end
    end

      describe 'last_name' do

        it 'can find with case sensitive search' do
          test_params = {"last_name" => "Last"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(2)
        end

        it 'can find with NON case sensitive search' do
          test_params = {"last_name" => "last"}

          find_customers = Customer.where_by_params(test_params)

          expect(find_customers.count).to eq(2)
        end
      end

    end

    describe 'Random' do
      it 'can return a random customer' do
        create_list(:customer, 100)

        random_customer1 = Customer.random
        random_customer2 = Customer.random

        retry_count = 0
        while random_customer1.id.eql?(random_customer2.id) && retry_count < 5
          retry_count =+ 1
          random_customer2 = Customer.random
        end

        expect(random_customer1.id.eql?(random_customer2.id)).to be_falsy
      end
    end

  end
end
