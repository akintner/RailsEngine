class AddInvoiceRefToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_items, :invoice, foreign_key: true
  end
end
