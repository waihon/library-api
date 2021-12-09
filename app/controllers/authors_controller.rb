class AuthorsController < ApplicationController
  before_action :authenticate, only: [:create]

  def context
    # Pass info from controller down to the user resource
    { current_user: @current_user }
  end
end