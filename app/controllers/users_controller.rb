class UsersController < ApplicationController

  def create
    byebug
    user = User.create(user_params)

    if user.valid?
      # token = encode_token({ user_id: user.id })

      render json: { user: user }, status: :created
    else
      render json: { error: user.errors }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
