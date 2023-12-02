class CreateFakeSetTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :fake_set_types do |t|
      t.string :parent
      t.string :type_generator
      t.integer :position
      t.belongs_to :fake_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
