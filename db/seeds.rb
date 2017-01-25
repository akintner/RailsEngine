# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def empty_tables
  puts 'Start emptying all database tables. Be patient, might take a while...'
  InvoiceItem.destroy_all
  Transaction.destroy_all
  Invoice.destroy_all
  Item.destroy_all
  Merchant.destroy_all
  Customer.destroy_all
  puts 'Finished emptying all database tables!'
end

def import_customers_csv
  puts 'Starting Customer CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:customers)
  CSV.foreach('db/import_csv/customers.csv', :headers=> true) do |row|
    Customer.create(first_name: row['first_name'],
                    last_name: row['last_name'],
                    created_at: row['created_at'],
                    updated_at: row['updated_at'])
  end
  puts 'Customer CSV import completed!'
end

def import_invoice_items_csv
  puts 'Starting Invoice Item CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:invoice_items)
  CSV.foreach('db/import_csv/invoice_items.csv', :headers=> true) do |row|
    InvoiceItem.create(item_id: row['item_id'],
                      invoice_id: row['invoice_id'],
                      quantity: row['quantity'],
                      unit_price: row['unit_price'],
                      created_at: row['created_at'],
                      updated_at: row['updated_at'])
  end
  puts 'Invoice Item CSV import completed!'
end

def import_invoices_csv
  puts 'Starting Invoice CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:invoices)
  CSV.foreach('db/import_csv/invoices.csv', :headers=> true) do |row|
    Invoice.create(customer_id: row['customer_id'],
                    merchant_id: row['merchant_id'],
                    status: row['status'],
                    created_at: row['created_at'],
                    updated_at: row['updated_at'])
  end
  puts 'Invoice CSV import completed!'
end

def import_items_csv
  puts 'Starting Item CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:items)
  CSV.foreach('db/import_csv/items.csv', :headers=> true) do |row|
    Item.create(name: row['name'],
                    description: row['description'],
                    unit_price: row['unit_price'],
                    merchant_id: row['merchant_id'],
                    created_at: row['created_at'],
                    updated_at: row['updated_at'])
  end
  puts 'Item CSV import completed!'
end

def import_merchants_csv
  puts 'Starting Merchant CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:merchants)
  CSV.foreach('db/import_csv/merchants.csv', :headers=> true) do |row|
    Merchant.create(name: row['name'],
                    created_at: row['created_at'],
                    updated_at: row['updated_at'])
  end
  puts 'Merchant CSV import completed!'
end

def import_transactions_csv
  puts 'Starting Transaction CSV file import...'
  ActiveRecord::Base.connection.reset_pk_sequence!(:transactions)
  CSV.foreach('db/import_csv/transactions.csv', :headers=> true) do |row|
    Transaction.create(credit_card_number: row['credit_card_number'],
                    result: row['result'],
                    created_at: row['created_at'],
                    updated_at: row['updated_at'])
  end
  puts 'Transaction CSV import completed!'
end