class BooksController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :remove_computed_attributes, only: [:create, :update]

  def remove_computed_attributes
    computed_attributes = [:username]
    computed_attributes.each do |attribute|
      if params.dig(:data, :attributes, attribute)
        params[:data][:attributes] = params[:data][:attributes].except attribute
      end
    end
  end
end
