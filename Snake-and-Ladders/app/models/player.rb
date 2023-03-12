class Player < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  after_save :new_player
  after_destroy :remove_player
  
  def new_player
      ActionCable.server.broadcast "room_channel_#{room_id}", {
      type: "new_player",
      user: user
      }
  end
  def remove_player
    ActionCable.server.broadcast "room_channel_#{room_id}", {
    type: "remove_player",
    user: user,
    room_id: room_id
    }
end
end
