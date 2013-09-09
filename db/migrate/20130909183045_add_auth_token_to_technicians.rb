class AddAuthTokenToTechnicians < ActiveRecord::Migration
  def change
    add_column :technicians, :auth_token, :string
  end
end
