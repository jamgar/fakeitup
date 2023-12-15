class AddIndexToTypesLists < ActiveRecord::Migration[7.1]
  def change
    add_index :types_lists, :parent
  end
end
