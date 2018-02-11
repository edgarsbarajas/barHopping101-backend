class EventbriteController < ApplicationController
  require 'httparty'

  def search
    p "*" * 100
    p params

    events = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?token=#{ENV['EVENTBRITE']}&q=bar&location.address=#{params['city']}")

    render :json => events["events"]
  end
end
