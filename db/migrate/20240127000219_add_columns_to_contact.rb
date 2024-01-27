class AddColumnsToContact < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :sex, :string, null: false, default: 'N/A'
    add_column :contacts, :lastname, :string, null: false, default: 'N/A'
    add_column :contacts, :description, :string, null: false, default: 'N/A'
  end
end
