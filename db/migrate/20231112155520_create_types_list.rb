class CreateTypesList < ActiveRecord::Migration[7.1]
  def change
    create_table :types_lists do |t|
      t.string :name
      t.text :sub_types

      t.timestamps
    end
  end
end
