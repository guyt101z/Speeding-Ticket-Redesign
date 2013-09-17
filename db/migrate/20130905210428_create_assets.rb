class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :user_id
      t.string :location
      t.integer :tag_number
      t.string :asset_type
      t.string :asset_name
      t.string :model
      t.string :serial_number
      t.string :manufacturer
      t.string :mac_address1
      t.string :mac_address2
      t.string :mac_address3
      t.string :description
      t.text :notes
      t.text :other

      t.timestamps
    end
  end
end
