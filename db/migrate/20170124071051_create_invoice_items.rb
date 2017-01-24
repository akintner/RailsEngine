class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.integer       :item_id
      t.integer       :invoice_id
      t.integer       :quantity
      t.integer       :unit_price
      t.datetime      :created_at
      t.datetime      :updated_at

      t.timestamps    null:false
    end
  end
end
