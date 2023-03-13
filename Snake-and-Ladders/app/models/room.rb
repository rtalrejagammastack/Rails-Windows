class Room < ApplicationRecord
    after_update :change_room_status, if: :status?

    # after_commit :broadcast_changes

    # def broadcast_changes
    #     ActionCable.server.broadcast "room_channel_#{current_room.id}", {
    #     type: "update_post",
    #     post_id: id,
    #     title: title,
    #     body: body
    #     }
    # end
    # before_save :check_already_in_room
    has_many :players , dependent: :destroy
    validates :name, presence: true,uniqueness: true


    private
        def change_room_status
            if status == 'playing'
                ActionCable.server.broadcast "room_channel_#{id}", {
                    type: "start_game",
                    chance: players.first.user
                }
            else
                ActionCable.server.broadcast "room_channel_#{id}", {
                    type: "stop_game",
                }
            end
        end
        # def check_already_in_room
        #     if current_user.room.presnet?
        #         self.errors.add(:base,"You are alread in a room.")
        #     end
        # end
end
