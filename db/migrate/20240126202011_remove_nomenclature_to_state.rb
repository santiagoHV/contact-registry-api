class RemoveNomenclatureToState < ActiveRecord::Migration[7.1]
  def change
    remove_column :states, :nomenclature, :string
  end
end
