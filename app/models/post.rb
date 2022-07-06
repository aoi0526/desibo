class Post < ApplicationRecord
  has_many :commnets
  has_many :likes

  belongs_to :company

  has_many_attached :post_images
end
