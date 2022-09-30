class AddCityBarangayToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city, :string
    add_column :users, :barangay, :string
  end
end
