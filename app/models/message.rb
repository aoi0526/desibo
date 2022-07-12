class Message < ApplicationRecord
  belongs_to :room
  belongs_to :company, optional: true # belongs_toのnull制約を許容する
  belongs_to :user, optional: true # belongs_toのnull制約を許容する

  validates :body, presence: true
end
