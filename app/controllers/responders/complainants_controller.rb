module Responders
  class ComplainantsController < ::Responders::RespondersController
    before_action :get_complainant, only: [:show, :update]

    def index
      render json: current_user.complainants.where(filter_params).uniq
    end

    def show
      render json: @complainant
    end

    def update
      if @complainant.update(complainant_params.except(:id))
        render json: @complainant
      else
        render json: { errors: @complainant.errors.full_messages }
      end
    end

    private
    def get_complainant
      @complainant = current_user.complainants.find_by(id: params[:id])
      not_found unless @complainant
    end

    def filter_params
      params.permit(:id, :status)
    end
  
    def complainant_params
      params.require(:complainant).permit(:id, :status)
    end
  end
end
