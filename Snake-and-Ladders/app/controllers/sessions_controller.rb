class SessionsController < ApplicationController
    def new
        @session = Session.new
    end
    def create
        @user = User.find_by(session_params);
        if @user
            if @user.session
                @user.session.destroy
            end
            @user.build_session().save
            session[:user_id] = @user.id   
            redirect_to rooms_path, notice: 'Logged in!'   
        else   
            render :new, notice: 'Wrong E-mail or password.' 
        end   
    end
    def destroy
        current_user.session.destroy
        session[:user_id] = nil   
        redirect_to root_url, notice: 'Logged out!'   
    end
    private 
        def session_params
            params.require(:session).permit(:email,:password)
        end
end
