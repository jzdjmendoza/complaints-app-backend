module Complainants
  class ComplaintsController < ::Complainants::ComplainantsController
    # before_action :get_complainant

    def index
      @complaints = current_user.complaints
    end

    def show
      @complaint = current_user.complaints.find_by(id: params[:id])
      not_found  unless @complaint

      @complaint
    end

    def create
      @complaint = current_user.complaints.new(complaint_params)
      render json: { errors: @complaint.errors.full_messages } unless @complaint.save
      @complaint
    end

    private
    def complaint_params
      params.require(:complaint).permit(:subject, :body, :status, :city, :barangay)
    end
  end
end
