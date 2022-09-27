require 'rails_helper'

RSpec.describe "Complainants::Complaints", type: :request do
  describe "GET /index" do
    before do
    end
    subject { get: index }
    it { should have_http_status(:success) }
  end
end
