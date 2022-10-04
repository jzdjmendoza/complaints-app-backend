class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation,
                                 :city, :barangay, :type, :contact_number)
  end
end
