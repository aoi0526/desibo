class Message < ApplicationRecord
  belongs_to :room
  belongs_to :company
  belongs_to :user
end
