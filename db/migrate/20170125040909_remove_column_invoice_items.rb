class RemoveColumnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :item_id
    remove_column :invoice_items, :invoice_id
  end
end
