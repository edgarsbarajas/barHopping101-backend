class GoogleController < ApplicationController
  def user_location
    response = HTTParty.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_MAPS_KEY']}")

    render json: response.parsed_response["location"]
  end
end
