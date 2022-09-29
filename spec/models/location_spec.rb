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
require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:barangay) }
    it { should validate_presence_of(:city) }
    it { should validate_uniqueness_of(:barangay).scoped_to(:city) }
    it { should belong_to(:responder).with_foreign_key(:responder_id) }
  end
end
