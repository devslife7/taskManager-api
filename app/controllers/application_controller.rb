class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, "Secret", "HS256")
  end

  def logged_in?
    headers = request.headers["Authorization"]
    token = request.split("")[1]

    begin
      user_id = JWT.decode(token, "Secret", "HS256")[0]["user_id"]
      User.find(user_id)
    rescue
      nil
    end
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
