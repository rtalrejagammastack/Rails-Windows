class ApplicationController < ActionController::Base
    before_action :set_current_user,:set_count_members

    private

        def set_current_user
            session[:user_name] = "Rohit"
        end 

        def set_count_members
            @count = ActionCable.server.connections.display
            # debugger
        end

        def current_members
            @count 
        end

        helper_method :current_members
end
