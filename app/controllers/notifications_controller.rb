class NotificationsController < ApplicationController
  def index
    # Return unread notifications
    @notifications = current_user.notifications.where(read: false)
  end
end
