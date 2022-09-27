class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.text :body
      t.string :subject
      t.belongs_to :complainant, polymorphic: true
      t.belongs_to :responder, polymorphic: true
      t.string :status, default: 'pending'
      t.string :city
      t.string :barangay

      t.timestamps
    end
  end
end
