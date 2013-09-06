class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.attachment :avatar

      t.timestamps
    end
  end
end
