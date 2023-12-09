class AddPublishedToTypesLists < ActiveRecord::Migration[7.1]
  def change
    add_column :types_lists, :published, :boolean, default: false
  end
end
