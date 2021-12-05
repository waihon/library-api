class UsersController < ApplicationController
  before_action :authenticate, only: [:show_current]

  def show_current
    # Setting nil as the context since we don't need to modify this any more with
    # our request data.
    user_resource = UserResource.new(@current_user, nil)

    resource_serializer = JSONAPI::ResourceSerializer.new(UserResource)
    # Replacing serialize_to_hash with object_hash as per:
    # https://github.com/cerebris/jsonapi-resources/issues/1149#issuecomment-657913006
    json = resource_serializer.object_hash(user_resource, nil)

    render json: json
  end
end