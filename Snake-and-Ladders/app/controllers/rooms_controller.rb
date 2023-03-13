class RoomsController < ApplicationController
    def index
        if !current_user
            redirect_to root_path
        end
        if current_user.player.present?
            current_user.player.destroy
        end
        session[:room_id] = nil
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(name:room_params[:name],status:'waiting')
        if @room.save
            @room.players.create(user_id:current_user.id)
            session[:room_id] = @room.id
            redirect_to room_path(@room)
        else
            render :new
        end
    end

    def show
        @room = Room.find(params[:id])
    end
    
    def destroy
        @room = Room.find(params[:id])
        session[:room_id] = nil
        @room.destroy
        redirect_to rooms_path
    end
    
    def join
        @room = Room.find(params[:room_id])
        if @room.players.length < 4
            @room.players.create(user_id:current_user.id)
            session[:room_id] = @room.id
            redirect_to room_path(@room)
        else
            redirect_to rooms_path
        end
    end

    def trial
        ActionCable.server.broadcast("room_channel_#{params[:room_id]}", {content: 'Starting A Game in 5 Second.'})
    end

    def update
        current_user.player.destroy
        session[:room_id] = nil
        redirect_to rooms_path
    end

    def start
        @room = Room.find(params[:room_id])
        @room.update(status:"playing")
        
    end
    def wait
        @room = Room.find(params[:room_id])
        @room.update(status:"waiting")
    end

    private
        def room_params
            params.require(:room).permit(:name)
        end
end
