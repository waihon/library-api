require 'jwt'

class SessionController < ApplicationController
  def create
    email = params["email"]
    password = params["password"]

    begin
      user = User.find_by!(email: email)
      data = { id: user.id, username: user.username, email: user.email }
      payload = { data: data, sub: user.id, exp: Time.now.to_i + 2 * 3600 } # 2 hours

      token = JWT.encode payload, JWT_SECRET, "HS512" # an HMAC algorithm

      render json: { token: token }
    rescue => exception
      render status: :unauthorized, json: {
        errors: [
          status: 401,
          title: "Unauthorized",
          detail: "Error logging in user with that email and password"
        ]
      }
    end
  end
end