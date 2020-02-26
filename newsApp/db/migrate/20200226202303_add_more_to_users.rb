class AddMoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :number
    add_column :users, :country, :string
  end
end
