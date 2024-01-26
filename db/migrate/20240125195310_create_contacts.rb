class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthdate
      t.string :email
      t.string :address
      t.string :address_detail
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
