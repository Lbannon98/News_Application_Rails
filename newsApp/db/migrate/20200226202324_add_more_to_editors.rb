class AddMoreToEditors < ActiveRecord::Migration[5.2]
  def change
    add_column :editors, :name, :string
    add_column :editors, :age, :number
    add_column :editors, :country, :string
  end
end
