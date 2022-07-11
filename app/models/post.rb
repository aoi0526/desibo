class Post < ApplicationRecord
  has_many :commnets
  has_many :likes, dependent: :destroy
  has_many :liked_user, through: :likes, source: :user

  belongs_to :company

  has_one_attached :post_image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
