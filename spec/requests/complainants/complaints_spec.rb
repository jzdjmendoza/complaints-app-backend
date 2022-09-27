require 'rails_helper'

RSpec.describe "Complainants::Complaints", type: :request do
  describe "GET /index" do
    subject { get: index }
    it { should have_http_status(:success) }
  end
end
