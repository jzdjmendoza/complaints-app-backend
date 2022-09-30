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

RSpec.describe Users::Complainant, type: :model do

  describe 'Validations' do 
    it { have_many(:complaints).with_foreign_key(:complainant_id) }
    it { validate_presence_of(:status) }
  end

  describe 'Callbacks' do
    it 'should have pending status as default' do
      user = Users::Complainant.create(first_name: 'Test', last_name: 'User', email: 'test@user.com', city: 'Test City', barangay: 'Test Barangay',
                                       password: 'password', password_confirmation: 'password')
      expect(user.persisted?).to eq(true)
      expect(user.status).to eq('pending')
    end
  end
end
