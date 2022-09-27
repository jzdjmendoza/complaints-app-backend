module Complainants
  class ComplainantsController < ApplicationController
    before_action :get_complainant

    private
    def get_complainant
      @complainant_id = ::Users::Complainant.find_by(id: params[:complainant_id])
    end
  end
end
