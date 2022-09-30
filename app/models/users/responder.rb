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

# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

module Users
  class Responder < User
    has_many :complaints, foreign_key: :responder_id, as: :responder
    has_many :complainants, through: :complaints

    validates_uniqueness_of :barangay, scope: :city
  end
end
