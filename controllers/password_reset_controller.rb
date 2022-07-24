class PasswordResetController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
            redirect_to root_path, notice: "A link has been sent to your email to reset password."
        else
            flash[:alert] = "Email not found"
            render :new
        end
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InValidSignature
        redirect_to sign_in_path, notice: "Your token has expired, please try again."
    end
    
    def update 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, alert: "Your password was reset successfully, please sign in."
        else
            render :edit
        end

    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end
