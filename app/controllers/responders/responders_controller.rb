module Responders
  class RespondersController < ApiController
    before_action :check_if_responder

    private

    def check_if_responder
      unauthorized('Only registered responder can access') unless current_user.type == 'Users::Responder'
    end
  end
end
