class ChangeColumnTypesToCitext < ActiveRecord::Migration[5.0]
  enable_extension('citext')

  def change
    # To handle find and find_all endpoint inputs case insensitive
    change_column :customers, :first_name, :CITEXT
    change_column :customers, :last_name, :CITEXT
    change_column :invoices, :status, :CITEXT
    change_column :items, :name, :CITEXT
    change_column :items, :description, :CITEXT
    change_column :merchants, :name, :CITEXT
    change_column :transactions, :credit_card_number, :CITEXT
    change_column :transactions, :result, :CITEXT
  end
end
