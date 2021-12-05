class SessionController < ApplicationController
  def create
    email = params["email"]
    password = params["password"]

    begin
      user = User.find_by!(email: email)

      render json: { id: user.id, username: user.username, email: user.email }
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