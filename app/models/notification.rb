class Notification < ApplicationRecord

  enum action: {like: 0, message: 1}

  belongs_to :post, optional: true
  belongs_to :message, optional: true
  belongs_to :visiter, class_name: 'User', foreign_key: 'user_visiter_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'user_visited_id', optional: true
	belongs_to :visiter, class_name: 'company', foreign_key: 'company_visiter_id', optional: true
	belongs_to :visited, class_name: 'company', foreign_key: 'company_visited_id', optional: true
end
