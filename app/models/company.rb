class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts
  has_many :comments
  has_many :fovorites
  has_many :rooms
  has_many :messages
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :active_notifications, class_name: "Notification", foreign_key: "company_visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "company_visited_id", dependent: :destroy

  belongs_to :occupation_genre

  has_one_attached :company_image

  def get_company_image
    (company_image.attached?) ? company_image : 'no-image.jpeg'
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
