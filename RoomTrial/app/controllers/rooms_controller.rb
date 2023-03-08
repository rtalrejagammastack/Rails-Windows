class RoomsController < ApplicationController
    def index
        # session[:room_id] = nil
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            @room.players.create(name:current_user.name)            
            redirect_to room_path(@room)
        else
            render :new
        end
    end

    def show
        @room = Room.find(params[:id])
    end
    
    def join
        @room = Room.find(params[:id])
        if @room.players.length < 4
            puts '###########################33'
            puts @room,current_user
            @room.players.create(name:current_user.name)
            puts @room.players.length
            session[:room_id] = @room.id
            redirect_to room_path(@room)
        else
            redirect_to rooms_path
        end
    end

    def leave
        session[:room_id] = nil
        redirect_to rooms_path
    end
    
    def destroy
        @room = Room.find(params[:id])
        session[:room_id] = nil
        @room.destroy
        redirect_to rooms_path
    end
    
    def start
        @room = Room.find(params[:id])
    end

    private
        def room_params
            params.require(:room).permit(:name)
        end
end
