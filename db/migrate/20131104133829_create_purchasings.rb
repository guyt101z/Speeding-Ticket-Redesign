class CreatePurchasings < ActiveRecord::Migration
  def change
    create_table :purchasings do |t|
      t.integer :purchase_id
      t.integer :asset_id

      t.timestamps
    end
  end
end
