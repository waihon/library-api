require 'jwt'

class SessionController < ApplicationController
  def create
    email = params["email"]
    password = params["password"]

    begin
      user = User.find_by!(email: email) # using ! will raise an exception when not found

      # This may look counter-intuitive but it's actually how a hashed password is compared
      # with a clear password.
      if BCrypt::Password.new(user.password_digest) == password
        data = { id: user.id, username: user.username, email: user.email }
        payload = { data: data, sub: user.id, exp: Time.now.to_i + 2 * 3600 } # 2 hours

        token = JWT.encode payload, JWT_SECRET, "HS512" # an HMAC algorithm

        render json: { token: token }
      else
        render_unauthorized
      end
    rescue => exception
      render_unauthorized
    end
  end

private

  def render_unauthorized
    render status: :unauthorized, json: {
      errors: [
        status: 401,
        title: "Unauthorized",
        detail: "Error logging in user with that email and password"
      ]
    }
  end
end