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

  belongs_to :occupation_genre

  has_one_attached :company_image

  def get_company_image
    (company_image.attached?) ? company_image : 'no-image.jpeg'
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
