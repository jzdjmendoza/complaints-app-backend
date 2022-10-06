require 'rest-client'

class SendMessage
  def initialize(message, number)
    @message = message
    @number = number
  end

  def send_message
    payload = {
      "Email": ENV['itexmo_email'],
      "Password": ENV['itexmo_password'],
      "Recipients": [@number],
      "Message": @message,
      "ApiCode": ENV['itexmo_api_code'],
      "SenderId": "CRIMS"
    }
    RestClient.post(ENV['itexmo_url'], payload.to_json, { content_type: :json, accept: :json })
  end
end