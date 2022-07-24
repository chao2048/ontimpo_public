class SettingsController < ApplicationController
  before_action :require_user_logged_in!
  
  def index
    user = User.find_by(email: params[:email])
    name = Current.user.name
    email = Current.user.email
  end


  def update
    if Current.user.update(user_params)
        redirect_to settings_path, notice: "Profile updated!"
    else
        render :index
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
