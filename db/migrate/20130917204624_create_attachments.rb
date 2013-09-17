class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :asset_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
