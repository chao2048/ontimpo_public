class SetcheckController < ApplicationController
  before_action :require_user_logged_in!
  def index
  end

  def check
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      redirect_to settings_path
    else
      flash[:alert] = "Invalid password"
      render :index
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
