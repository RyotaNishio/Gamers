class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.all.order('created_at DESC')
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
