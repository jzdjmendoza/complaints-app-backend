require 'rails_helper'

RSpec.describe "Responders::Complainants", type: :request do
  describe 'GET' do
    fixtures :all
    let(:user) { users(:responder) }
    let(:complainant) { users(:complainant) }
    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Authorization': "Token #{ user.generate_jwt }"
      }
    end

    it 'should not be able to access if not a complainant' do
      get '/api/v1/responders/complainants', params: {}, headers: { 'Content-Type': 'application/json', 'Authorization': "Token #{ users(:responder) }"}
      expect(response).to have_http_status(401)
    end

    it 'should get index' do
      get '/api/v1/responders/complainants', params: {}, headers: headers
      expect(response).to have_http_status(200)
      expect(response.body).to eq(user.complainants.to_json)
    end

    it 'should get show' do
      complaint = Complaint.last
      get "/api/v1/responders/complainants/#{complainant.id}", params: {}, headers: headers
      expect(response).to have_http_status(200)
    end

    it 'should be able to update complaint' do
      put "/api/v1/responders/complainants/#{complainant.id}", params: {status: 'verified'}.to_json, headers: headers
      expect(response).to have_http_status(200)
      expect(Users::Complainant.find(complainant.id).status).to eq('verified')
    end
  end
end
