module Api
  module V1
    class SeismicFeaturesController < ApplicationController
      before_action :set_access_control_headers, only: [:index]

      def index
        @earthquakes = Earthquake.includes(:comments)
        render json: @earthquakes.as_json(include: { comments: { only: :content } })
      end

      private

      def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*' # Replace with your actual allowed origin
        headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization' # Add any other required headers
      end
    end
  end
end