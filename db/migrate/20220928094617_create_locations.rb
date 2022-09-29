class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :barangay
      t.string :city
      t.belongs_to :responder, polymorphic: true

      t.timestamps
    end
  end
end
