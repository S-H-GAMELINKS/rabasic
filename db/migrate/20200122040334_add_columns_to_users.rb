class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :text
    add_column :users, :phone, :string
  end
end
