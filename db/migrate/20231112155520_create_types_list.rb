class CreateTypesList < ActiveRecord::Migration[7.1]
  def change
    create_table :types_lists do |t|
      t.string :parent
      t.text :type_generators

      t.timestamps
    end
  end
end
