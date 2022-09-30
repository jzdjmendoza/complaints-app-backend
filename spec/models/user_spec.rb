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

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:barangay) }
  end

  describe 'Public Methods' do
    fixtures :users
    let(:responder) { users(:responder) }

    it 'should return full name' do
      expect(responder.name).to eq "#{responder.first_name} #{responder.middle_name} #{responder.last_name}"
    end
  end
end
