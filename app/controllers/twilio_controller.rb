class TwilioController < ApplicationController
  def create
    require 'twilio-ruby'

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH']
    from = ENV['TWILIO_PHONE_NUMBER']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @message = @client.messages.create(
      from: from,
      to: '+1' + params['phoneNumber'].delete(" ()-."),
      body: params['messageBody'] + params['humanName']
    )

    puts @message.status
  end
end
