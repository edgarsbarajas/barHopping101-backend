class EventbriteController < ApplicationController
  require 'httparty'

  def search
    p "*" * 100
    p params

    events = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?token=#{ENV['EVENTBRITE']}&q=bar&location.address=#{params['city']}&start_date.keyword=#{params['start']}")

    render :json => events["events"]
  end

  def venue
    venue = HTTParty.get("https://www.eventbriteapi.com/v3/venues/#{params['id']}/?token=#{ENV['EVENTBRITE']}")

    latitude = venue.parsed_response['address']['latitude']
    longitude = venue.parsed_response['address']['longitude']

    render json: {latitude: latitude, longitude: longitude}
  end
end
