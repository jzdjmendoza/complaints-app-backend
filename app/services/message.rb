require 'rest-client'
require 'twilio-ruby'

class Message
  def initialize(message, number)
    @message = message
    @number = number
  end

  def send_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
                                      body: @message,
                                      from: '+12406417345',
                                      to: @number
                                    )
  end
end
