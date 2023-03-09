class UsersController < ApplicationController
    def new
        if current_user
            redirect_to rooms_path
        else
            @user = User.new
        end
    end
    def create
        @user = User.find_by(user_params)

        if @user
            session[:user_id] = @user.id  
            redirect_to rooms_path, alert: 'Logged In!'
        else
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id  
                redirect_to rooms_path, alert: 'Logged In!'
            else
                render :new
            end
        end
    end
    def destroy
        session[:user_id] = nil
        session[:room_id] = nil
        redirect_to root_path, alert: 'Logged out!'   
    end

    private
        def user_params
            params.require(:user).permit(:name)
        end
end
