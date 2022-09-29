module Complainants
  class ComplainantsController < ApplicationController
    before_action :check_if_complainant

    private

    def check_if_complainant
      unauthorized('Only registered complainant can access') unless current_user.type == 'Users::Complainant'
    end
  end
end
