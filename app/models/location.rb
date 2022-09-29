# == Schema Information
#
# Table name: locations
#
#  id             :bigint           not null, primary key
#  barangay       :string
#  city           :string
#  responder_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  responder_id   :bigint
#
# Indexes
#
#  index_locations_on_responder  (responder_type,responder_id)
#
class Location < ApplicationRecord
  belongs_to :responder, foreign_key: :responder_id, polymorphic: true

  validates_presence_of :barangay, :city
  validates :barangay, uniqueness: { scope: :city }
end
