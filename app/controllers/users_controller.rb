class UsersController < ApiController
  before_action :authenticate_user!

  def show
    current_user
  end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :middle_name, :last_name, :type)
  end
end
