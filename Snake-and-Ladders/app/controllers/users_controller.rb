class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to new_session_path,  notice: 'User Created. Login to continue...'
        else
            render :new, notice: "Unable to Create User. Try Again."
        end
    end
    private
        def user_params
            params.require(:user).permit(:name,:email,:password)
        end
end
