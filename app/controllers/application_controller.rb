class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

  def authenticate
    begin
      authenticate_or_request_with_http_token do |token, options|
        # Specifying true to validate the expiration time
        verified_token = JWT.decode token, JWT_SECRET, true, { algorithm: "HS512" }

        # JWT.decode returns an array, and the "sub" key stores the user id
        user_id = verified_token[0]["sub"]

        @current_user = User.find(user_id)
      end
    rescue => exception
      render status: :unauthorized, json: {
        errors: [
          {
            status: 401,
            title: "Unauthorized"
          }
        ]
      }
    end
  end
end
