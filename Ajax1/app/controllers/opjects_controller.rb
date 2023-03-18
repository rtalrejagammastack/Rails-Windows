class OpjectsController < ApplicationController
  def index
    @opject = Opject.new
  end
  def update_second_select
    first_select_value = params[:first_select_value]

    # case first_select_value
    # when '1'
    #   options = [['Option A', 1], ['Option B', 2]]
    # when '2'
    #   options = [['Option C', 3], ['Option D', 4]]
    # else
    #   options = []
    # end

    options = Opject.where(first_option_id: selected_option)
    
    render json: options.to_json(xonly: [:id, :name])
    # render js: "$('#opject_second_select').html('#{j options_for_select(options)}')"
  end
end
