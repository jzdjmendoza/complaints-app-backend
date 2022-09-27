# == Schema Information
#
# Table name: complaints
#
#  id               :bigint           not null, primary key
#  barangay         :string
#  body             :text
#  city             :string
#  complainant_type :string
#  responder_type   :string
#  status           :string           default("pending")
#  subject          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  complainant_id   :bigint
#  responder_id     :bigint
#
# Indexes
#
#  index_complaints_on_complainant  (complainant_type,complainant_id)
#  index_complaints_on_responder    (responder_type,responder_id)
#

class Complaint < ApplicationRecord
  extend Enumerize

  belongs_to :complainant, class_name: 'User', foreign_key: 'complainant_id'
  belongs_to :responder, class_name: 'User', foreign_key: 'responder_id'

  validates_presence_of :subject, :body, :status, :city, :barangay

  enumerize :status,
            in: %w[pending received dispatched]
end
