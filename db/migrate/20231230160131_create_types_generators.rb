class CreateTypesGenerators < ActiveRecord::Migration[7.1]
  def change
    create_table :types_generators do |t|
      t.string :name
      t.text :arguments
      t.belongs_to :types_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
