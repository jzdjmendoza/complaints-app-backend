# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  barangay               :string
#  city                   :string
#  contact_number         :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  middle_name            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  status                 :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

module Users
  class Complainant < User
    extend Enumerize

    has_many :complaints, foreign_key: :complainant_id, as: :complainant

    validates_presence_of :status

    enumerize :status,
              in: %w[pending verified]

    before_validation :add_default_status

    private
    def add_default_status
      return if status.present?
      self.status = 'pending'
    end
  end
end
