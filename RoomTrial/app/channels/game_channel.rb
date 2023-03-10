class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room_id]}""
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
