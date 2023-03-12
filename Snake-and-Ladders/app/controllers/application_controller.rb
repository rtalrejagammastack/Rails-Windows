class ApplicationController < ActionController::Base
    def current_user   
        User.where(id: session[:user_id]).first 
    end   
    def current_room
        Room.where(id: session[:room_id]).first 
    end   
    helper_method :current_user,:current_room  
end
