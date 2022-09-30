require 'rails_helper'

RSpec.describe "Responders::Complaints", type: :request do
  describe 'GET' do
    fixtures :all
    let(:user) { users(:responder) }
    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Authorization': "Token #{ user.generate_jwt }"
      }
    end

    it 'should not be able to access if not a complainant' do
      get '/api/v1/responders/complaints', params: {}, headers: { 'Content-Type': 'application/json', 'Authorization': "Token #{ users(:responder) }"}
      expect(response).to have_http_status(401)
    end

    it 'should get index' do
      get '/api/v1/responders/complaints', params: {}, headers: headers
      expect(response).to have_http_status(200)
      expect(response.body).to eq(user.complaints.to_json)
    end

    it 'should get show' do
      complaint = Complaint.last
      get "/api/v1/responders/complaints/#{complaint.id}", params: {}, headers: headers
      expect(response).to have_http_status(200)
    end

    it 'should be able to update complaint' do
      put '/api/v1/responders/complaints/1', params: {status: 'received', notes: 'test notes'}.to_json, headers: headers
      expect(response).to have_http_status(200)
      expect(Complaint.find(1).status).to eq('received')
      expect(Complaint.find(1).notes).to eq('test notes')
    end
  end
end
