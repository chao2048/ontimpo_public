class SessionController < ApplicationController
  def new

  end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully!"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def omniauth
      user = User.find_or_create_by(email: request.env['omniauth.auth'][:info][:email]) do |user|
        user.email = request.env['omniauth.auth'][:info][:email]
        user.name = request.env['omniauth.auth'][:info][:name]
        user.password = SecureRandom.hex(15)
      end
      if user.valid?
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully!"
      else
        redirect_to sign_in_path, notice: "Something went wrong, please create an Ontimpo account with your gmail first!"
      end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
  
end

