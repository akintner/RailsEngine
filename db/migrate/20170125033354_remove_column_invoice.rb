class RemoveColumnInvoice < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :merchant_id
    remove_column :invoices, :customer_id
  end
end
