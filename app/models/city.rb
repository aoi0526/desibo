class City < ApplicationRecord
  has_many :companies
  has_many :users
end
