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

class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :type, :barangay, :city

  enumerize :type,
            in: %w[Users::Admin Users::Complainant Users::Responder],
            predicates: true

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def generate_jwt
    ::JsonWebToken.encode({ id: id, exp: 60.days.from_now.to_i })
  end
end
