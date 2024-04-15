# spec/requests/seismic_data_spec.rb
require 'rails_helper'

RSpec.describe 'SeismicData', type: :request do
  describe 'GET /controllers/api/v1/seismic_data' do
    it 'returns seismic data in JSON format' do
      get '/controllers/api/v1/seismic_data'
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'POST /api/v1/seismic_data/:feature_id/comments' do
    it 'creates a comment for a specific seismic feature' do
      feature_id = 1 # Replace with an actual feature ID from the test database
      comment_body = 'Test comment'

      post "/api/v1/seismic_data/#{feature_id}/comments", params: { body: comment_body }.to_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json')
      expect(JSON.parse(response.body)['body']).to eq(comment_body)
    end
  end
end
