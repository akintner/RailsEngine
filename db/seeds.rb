# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def import_customers_csv
  puts 'Starting Customer CSV file import...'
  Customer.destroy_all
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
  InvoiceItem.destroy_all
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