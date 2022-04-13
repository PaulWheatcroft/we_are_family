class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        #flash[:notice] = "You submitted #{params[:user]}!"
        #puts "params are #{params[:user]}"
        #redirect_to root_path
        
        @user = User.new(user_params)
        if @user.save
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "You submitted #{params[:user]}!"
        else
            puts "That didn't work"
            redirect_to sign_up_path, alert: "That did not work #{@user.errors.full_messages}"
        end
    end

    private

    def user_params
        user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    end
end