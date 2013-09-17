class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :title
      t.string :version_number
      t.string :manufacturer
      t.string :license_type
      t.text :license_number

      t.timestamps
    end
  end
end
