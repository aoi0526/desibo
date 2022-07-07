class Post < ApplicationRecord
  has_many :commnets
  has_many :likes

  belongs_to :company

  has_one_attached :post_image
end
