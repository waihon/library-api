class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  rescue_from ForbiddenError, with: :reject_forbidden_request

  def reject_forbidden_request
    render status: 403, json: {
      errors: [
        {
          status: 403,
          title: "Forbidden",
          detail: "User does not have access to edit this resource"
        }
      ]
    }
  end

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

  def context
    # Pass info from controller down to resources that can be accessed
    # via context[:current_user] for example.
    { current_user: @current_user }
  end
end
