class PlayersController < ApplicationController
    def create
        @player = current_room.players.build(player_params)
        if @player.save
            redirect_to current_room
        else
            redirect_to root_path, alert: "Failed to create player"
        end
    end

    def update
        @player = current_room.players.find_by(params[:id])
        if @player.update(player_params)
            redirect_to current_room
        else
            redirect_to current_room,alert:'Failed to Update Player'
        end
    end

    private
        def player_params
            params.require(:player).permit(:name)
            end
        end
end
