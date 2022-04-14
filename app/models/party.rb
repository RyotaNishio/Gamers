class Party < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :joined_users, class_name: 'User', foreign_key: 'party_id'

  enum difficulty: { beginner: 0, hard: 1, extra: 2 }

  def joined?(user)
    joined_users.include?(user)
  end

  def user_join(user)
    joined_users << user
  end

  def user_withdraw(user)
    joined_users.delete(user)
  end

  def create_notification_party!(current_user)
  # すでに「いいね」されているか検索
  temp = Notification.where(["visitor_id = ? and visited_id = ? and pop_id = ? and action = ? ", current_user.id, owner_id, id, 'join_party'])
  # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        party_id: id,
        visited_id: owner_id,
        action: 'join_party'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
