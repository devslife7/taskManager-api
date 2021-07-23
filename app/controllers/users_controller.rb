class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :update]

  def create
    user = User.create(user_params)

    if user.valid?
      token = encode_token({ user_id: user.id })

      render json: { user: user, token: token },
        except: [:created_at, :updated_at, :password_digest], include: [:reports], status: :created
    else
      render json: { error: user.errors }, status: :not_acceptable
    end
  end

  def show
    user = User.find_by(id: params[:id])

    if user
      render json: user, except: [:created_at, :updated_at, :password_digest], include: [:reports], status: :accepted
    else
      render json: { error: user.error }, status: :not_acceptable
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user
      user.update(update_params)
      render json: user, except: [:created_at, :updated_at, :password_digest], include: [:reports], status: :accepted
    else
      render json: { error: 'user could not be found' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
