class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :asset_id
      t.integer :software_id
      t.integer :user_id
      t.string :item_name
      t.string :part_number
      t.string :account_number
      t.string :grant_account
      t.integer :quantity
      t.string :status
      t.attachment :invoice

      t.timestamps
    end
  end
end
