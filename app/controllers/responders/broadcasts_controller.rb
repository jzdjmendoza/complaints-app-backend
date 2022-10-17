module Responders
  class BroadcastsController < ::Responders::RespondersController
    def send_sms
      current_user.complainants.each do |user|
        next if user.contact_number.blank?
        message = Message.new(params[:message], user.contact_number)
        message.send_message
      end
      render status: 200
    end

    private
    def broadcast_params
      params.permit(:message)
    end
  end
end
