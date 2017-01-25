class RemoveColumFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :merchant_id
  end
end
