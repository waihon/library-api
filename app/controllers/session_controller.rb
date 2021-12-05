class SessionController < ApplicationController
  def create
    email = params["email"]
    password = params["password"]

    user = User.find_by!(email: email)

    # If the user is nil representing the email address is not found, the status
    # 404 (Not Found) will be returned.
    render json: { id: user.id, username: user.username, email: user.email }
  end
end