class ApplicationController < ActionController::Base
    before_action :set_current_user,:set_current_room

    private

        def set_current_user
              puts '*****************************************'
              puts session[:user_id],session[:room_id]
              puts '*****************************************'
           @current_user =  User.find_by(id: session[:user_id])
        end 

        def set_current_room
            @current_room = Room.find_by(id: session[:room_id])
        end

        def current_user
            @current_user
        end

        def current_room
            @current_room
        end
        helper_method :current_user,:current_room
end
