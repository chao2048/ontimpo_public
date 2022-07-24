class WreportsController < ApplicationController
  before_action :set_current_user
  def index
    @timerecord = Current.user.timerecords.find_each.group_by{ |timerecord| timerecord.created_at.beginning_of_week }
    # @timerecord_reverse = Hash[@timerecord.to_a.reverse].to_hash
  end
  private
  def set_current_user
    if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
    else 
      redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil? 
    end
  end
end
