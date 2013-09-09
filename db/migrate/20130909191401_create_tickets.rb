class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :asset_id
      t.string :title
      t.text :description
      t.string :status
      t.date :deadline
      t.boolean :priority
      t.text :update

      t.timestamps
    end
  end
end
