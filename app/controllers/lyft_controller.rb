class LyftController < ApplicationController
  require 'lyft'

  def index
    p "*lyft " * 100
    p "\n" * 5

    client = Lyft::Client.new(
      client_id: ENV['LYFT_CLIENT_ID'],
      client_secret: ENV['LYFT_SECRET'],
      use_sandbox: true
    )

    token = client.oauth.retrieve_access_token.env.body["access_token"]


    p client.availability.eta access_token: token,
                        params: {
                          lat: 37.7772,
                          lng: -122.4233
                        }
  end
end
