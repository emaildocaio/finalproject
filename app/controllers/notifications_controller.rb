class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.where(read: false)
  end
end
