class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :rooms
  has_many :messages
  has_many :likes
  has_many :commnets
  has_many :likes, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "user_visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "user_visited_id", dependent: :destroy


  has_one_attached :user_image

  def get_user_image
    (user_image.attached?) ? user_image : 'no-image.jpeg'
  end

  def liked_by?(post_id)
    like.where(post_id: post.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
