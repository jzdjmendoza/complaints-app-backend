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
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Users::Responder, type: :model do

  describe 'Validations' do 
    it { have_many(:complaints).with_foreign_key(:responder_id) }
    it { have_many(:complainants).through(:complaints) }
    it { validate_uniqueness_of(:barangay).scoped_to(:city) }
  end
end
