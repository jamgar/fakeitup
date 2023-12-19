class AddUserToFakeSets < ActiveRecord::Migration[7.1]
  def change
    add_reference :fake_sets, :user, foreign_key: true
  end
end
