class AddColumnsToCountry < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :state_nomenclature, :string
    add_column :countries, :phone_code, :string
  end
end
