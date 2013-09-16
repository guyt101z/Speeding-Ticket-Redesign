class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.integer :asset_id
      t.integer :software_id

      t.timestamps
    end
  end
end
