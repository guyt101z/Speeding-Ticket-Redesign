class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :ticket_id
      t.integer :technician_id
      t.text :comment

      t.timestamps
    end
  end
end