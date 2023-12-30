class RemoveTypeGeneratorsFromTypesLists < ActiveRecord::Migration[7.1]
  def change
    remove_column :types_lists, :type_generators, :string
  end
end
