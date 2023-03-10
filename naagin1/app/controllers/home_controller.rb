class HomeController < ApplicationController
    def index
        
    end
    def create
        puts params[:name]
        ActionCable.server.broadcast("room_channel", {appendName: true,content: params[:name]})
    end

    def start
        puts '####################'
        puts current_members
        puts '####################'
        ActionCable.server.broadcast("room_channel", {start: true,content: 'Starting A Game in 5 Second.'})
    end
end
