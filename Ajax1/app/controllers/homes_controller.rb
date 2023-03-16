class HomesController < ApplicationController
  def index
    @object = Object.new
  end
  def update_second_select
    first_select_value = params[:first_select_value]
    case first_select_value
    when '1'
      options = [['Option A', 1], ['Option B', 2]]
    when '2'
      options = [['Option C', 3], ['Option D', 4]]
    else
      options = []
    end
    render js: "$('#object_second_select').html('#{j options_for_select(options)}')"
  end
end
