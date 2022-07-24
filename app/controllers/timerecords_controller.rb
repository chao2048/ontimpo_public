class TimerecordsController < ApplicationController
    before_action :set_current_user
    #before_action :set_timerecord, except: [:create]
    def index
        @timerecord = Current.user.timerecords
    end

    def create
        @timerecord = Current.user.timerecords.build(timerecord_params)
        if @timerecord.save
            redirect_to timer_path, notice: "Time recorded"
        else
            flash[:alert] = "Something went wrong..."
            render :index
        end
    end


    private
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        else 
          redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil? 
        end
    end
    def set_timerecord
        @timerecord = Current.user.timerecords.find(params[:id])
    end
    def timerecord_params
        params[:timerecord].permit(:timetype, :period, :user_id)
    end
end
