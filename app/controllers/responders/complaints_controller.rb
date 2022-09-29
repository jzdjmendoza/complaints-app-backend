module Responders
  class ComplaintsController < ::Responders::RespondersController
    # before_action :get_complainant
    before_action :get_complaint, only: [:show, :update]

    def index
      render json: current_user.complaints
    end

    def show
      @complaint
    end

    def update
      if @complaint.update(complaint_params.except(:id))
        @complaint
      else
        render json: { errors: @complaint.errors.full_messages }
      end
    end

    private
    def get_complaint
      @complaint = current_user.complaints.find_by(id: params[:id])
      not_found unless @complaint
    end
  
    def complaint_params
      params.require(:complaint).permit(:id, :status)
    end
  end
end
