class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :image_data, :text
  end
end
