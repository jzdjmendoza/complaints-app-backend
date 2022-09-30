class AddNotesToComplaint < ActiveRecord::Migration[7.0]
  def change
    add_column :complaints, :notes, :text
  end
end
