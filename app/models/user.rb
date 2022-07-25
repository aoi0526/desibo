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


  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def get_user_image
    (user_image.attached?) ? user_image : 'no-image.jpeg'
  end

  def liked_by?(post_id)
    like.where(post_id: post.id).exists?
  end

  def self.user_guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com', prefecture_id: 12, city: '船橋市') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.prefecture_id = 12
      user.city = "船橋市"
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
