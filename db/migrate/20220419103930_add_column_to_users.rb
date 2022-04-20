class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :name,          unique: true
    add_index :users, :introduction,  unique: true
  end
end
