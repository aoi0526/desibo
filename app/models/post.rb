class Post < ApplicationRecord
  has_many :commnets
  has_many :likes, dependent: :destroy
  has_many :liked_user, through: :likes, source: :user
  has_many :notifications, dependent: :destroy

  belongs_to :company

  has_many_attached :post_images

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def create_notification_by(current_user, company_visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      company_visited_id: company_visited_id,
      action: "like"
    )
    notification.save if notification.valid?
  end

end
