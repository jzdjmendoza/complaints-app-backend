# == Schema Information
#
# Table name: complaints
#
#  id               :bigint           not null, primary key
#  barangay         :string
#  body             :text
#  city             :string
#  complainant_type :string
#  notes            :text
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

  belongs_to :complainant, class_name: 'Users::Complainant', foreign_key: 'complainant_id', polymorphic: true
  belongs_to :responder, class_name: 'Users::Responder', foreign_key: 'responder_id', polymorphic: true

  validates_presence_of :subject, :body, :status, :city, :barangay

  enumerize :status,
            in: %w[pending received dispatched]

  before_validation :add_responder

  delegate :name, to: :responder, prefix: true
  delegate :status, to: :responder, prefix: true

  private
  def add_responder
    return if responder_id.present?
    responder = Users::Responder.find_by(city: city, barangay: barangay)
    self.responder = responder if responder
  end
end
