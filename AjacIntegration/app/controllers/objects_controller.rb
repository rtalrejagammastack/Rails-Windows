class ObjectsController < ApplicationController
  def index
  end
  def fetch
    selected_option = params[:selected_option]

    options = Option.where(first_option_id: selected_option)

    render json: options.to_json(only: [:id, :name])
  end
end
