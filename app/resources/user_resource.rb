class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation

  def fetchable_fields
    # Prevent sensitive fields from being shown to the users
    super - [:password, :password_confirmation]
  end
end