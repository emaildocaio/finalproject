class NotificationsController < ApplicationController
  def index
    # Return unread notifications
    @notifications = current_user.notifications.where(read: false).paginate(:page => params[:page], :per_page => 10)
  end
end
