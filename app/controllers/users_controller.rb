class UsersController < ApplicationController
  def show_current
    begin
      authenticate_or_request_with_http_token do |token, options|
        # Specifying true to validate the expiration time
        verified_token = JWT.decode token, JWT_SECRET, true, { algorithm: "HS512" }

        # JWT.decode returns an array, and the "sub" key stores the user id
        user_id = verified_token[0]["sub"]

        @current_user = User.find(user_id)
      end

      resource_serializer = JSONAPI::ResourceSerializer.new(UserResource)
      # Setting nil as the context since we don't need to modify this any more with
      # our request data.
      user_resource = UserResource.new(@current_user, nil)
      # Replacing serialize_to_hash with object_hash as per:
      # https://github.com/cerebris/jsonapi-resources/issues/1149#issuecomment-657913006
      json = resource_serializer.object_hash(user_resource, nil)

      render json: json
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