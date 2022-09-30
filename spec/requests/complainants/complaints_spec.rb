require 'rails_helper'

RSpec.describe "Complainants::Complaints", type: :request do
  describe 'GET' do
    fixtures :all
    let(:user) { users(:complainant) }
    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Authorization': "Token #{ user.generate_jwt }"
      }
    end
    let(:complaint_params) do
      {
        complaint: {
          subject: 'Test Subject',
          body: 'Test Body for Subject',
          city: user.city,
          barangay: user.barangay
        }
      }.to_json
    end

    it 'should not be able to access if not a complainant' do
      get '/api/v1/complainants/complaints', params: {}, headers: { 'Content-Type': 'application/json', 'Authorization': "Token #{ users(:responder) }"}
      expect(response).to have_http_status(401)
    end

    it 'should get index' do
      get '/api/v1/complainants/complaints', params: {}, headers: headers
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq(user.complaints.count)
    end

    it 'should get show' do
      post '/api/v1/complainants/complaints', params: complaint_params, headers: headers
      complaint = Complaint.last
      get "/api/v1/complainants/complaints/#{complaint.id}", params: {}, headers: headers
      expect(response).to have_http_status(200)
    end

    it 'should create complaint' do
      expect {
        post '/api/v1/complainants/complaints', params: complaint_params, headers: headers
      }.to change(Complaint, :count).by(1)
      expect(response).to have_http_status(200)
      expect(Complaint.last.responder_id.present?).to eq(true)
    end
  end
end
