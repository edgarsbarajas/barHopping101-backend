class LyftController < ApplicationController
  require 'lyft'

  def cost_estimates
    client = Lyft::Client.new(
      client_id: ENV['LYFT_CLIENT_ID'],
      client_secret: ENV['LYFT_SECRET'],
      use_sandbox: true
    )

    token = ENV['LYFT_TOKEN']

    costs = client.availability.cost(access_token: token,
                         params: {
                           start_lat: params["humanCoordinates"]["latitude"],
                           start_lng: params["humanCoordinates"]["longitude"],
                           end_lat: params["venueCoordinates"]["latitude"],
                           end_lng: params["venueCoordinates"]["longitude"],
                         })

    render json: costs.env.body["cost_estimates"].select{|ride| ride['ride_type'] == 'lyft' || ride['ride_type'] == 'lyft_line'}
  end
end
