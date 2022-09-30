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
require 'rails_helper'

RSpec.describe Complaint, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:barangay) }
  end

  describe 'Associations' do
    it { should belong_to(:complainant).with_foreign_key(:complainant_id) }
    it { should belong_to(:responder).with_foreign_key(:responder_id) }
  end

  describe 'Callback functions' do
    fixtures(:all)
    let(:responder) { users(:responder) }
    let(:complainant) { users(:complainant) }
    it 'should have responder' do
      record = complainant.complaints.create(subject: 'Test', body: 'Test Body', city: responder.city, barangay: responder.barangay)
      expect(record.persisted?).to eq(true)
      expect(record.responder_id).to eq(responder.id)
    end
  end
end
