class HomeController < ApplicationController
    def index
    end
    def create
        @user = User.find_by_email(params[:email])   
        if @user   
            session[:user_id] = @user.id   
            redirect_to root_path,notice:"User successfully logged in."
        else   
            @user = User.new(name:params[:name],email:params[:email])
            if @user.save
                session[:user_id] = @user.id  
                redirect_to root_path,notice:"New User Created."
            else 
                redirect_to root_path, notice:"Unable to create User. Please try again."
            end
        end  
    end
    def destroy
        session[:user_id] = nil   
        redirect_to root_url,notice:"User Logged Out."  
    end
end