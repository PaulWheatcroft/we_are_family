class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "If that account exists we sent you a link"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, notice: "Your link has expired"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(params.require(:user).permit(:password, :password_confirmation))
            redirect_to sign_in_path, notice: "Password was successully changed, please log in"
        else
            redirect_to password_reset_edit_path, notice: "Passwords were not matched"
        end
    end
end