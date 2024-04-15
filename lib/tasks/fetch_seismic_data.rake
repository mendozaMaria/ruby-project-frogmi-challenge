require 'json'
require 'httparty'

namespace :data do
  desc "Fetch and persist seismic data from USGS"
  task fetch_seismic: :environment do
    url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    begin
      response = HTTParty.get(url)
      data = JSON.parse(response.body)

      persist_seismic_data(data['features'])

      logger.info "Seismic data fetched and persisted successfully!"
    rescue StandardError => e
      logger.error "An error occurred while fetching or persisting seismic data: #{e.message}"
    end
  end

  def persist_seismic_data(features)
    features.each do |feature|
      Earthquake.create(
        magnitude: feature['properties']['mag'],
        place: feature['properties']['place'],
        time: Time.at(feature['properties']['time'] / 1000) # Convert milliseconds to seconds
        # Add more fields as needed
      )
    end
  end

  def logger
    @logger ||= Logger.new(STDOUT)
  end
end



