class AuthorsController < ApplicationController
  before_action :authenticate, only: [:create, :update]
end