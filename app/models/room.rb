class Room < ApplicationRecord
  has_many :user_rooms
  has_many :chats

  def create_notification_chat!(current_user, chat_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = UserRoom.where(room_id: id).where.not(user_id: current_user.id)
    temp_ids.each do |temp_id|
      save_notification_chat!(current_user, chat_id, temp_id['user_id'])
    end
  end

  def save_notification_chat!(current_user, chat_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      room_id: id,
      chat_id: chat_id,
      visited_id: visited_id,
      action: 'chat'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
