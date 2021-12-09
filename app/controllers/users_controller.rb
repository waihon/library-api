class UsersController < ApplicationController
  before_action :authenticate, only: [:show_current]

  def show_current
    # Setting nil as the context since we don't need to modify this any more with
    # our request data.
    user_resource = UserResource.new(@current_user, nil)

    resource_serializer = JSONAPI::ResourceSerializer.new(UserResource)
    # jsonapi-resources 0.9
    json = resource_serializer.serialize_to_hash(user_resource)
    # jsonapi-resources 0.10
    # Replacing serialize_to_hash with object_hash as per:
    # https://github.com/cerebris/jsonapi-resources/issues/1149#issuecomment-657913006
    # json = resource_serializer.object_hash(user_resource, nil)

    # jsonapi-resources 0.9
    render json: json
    # jsonapi-resources 0.10
    # Unlike serialize_to_hash, object_hash doesn't add any data key.
    # So, we'll have to manually add such key in order for the JSON response
    # to be a valid JSON API document.
    # render json: { data: json }
  end
end