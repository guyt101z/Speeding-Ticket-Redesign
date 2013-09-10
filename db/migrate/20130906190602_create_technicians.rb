class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.attachment :avatar
      t.string :auth_token

      t.timestamps
    end
  end
end
