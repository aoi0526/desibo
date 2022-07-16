class Notification < ApplicationRecord

  enum action: {like: 0, user_message: 1, company_message: 2}

  belongs_to :post, optional: true
  belongs_to :message, optional: true
  belongs_to :user_visiter, class_name: 'User', foreign_key: 'user_visiter_id', optional: true
  belongs_to :user_visited, class_name: 'User', foreign_key: 'user_visited_id', optional: true
  belongs_to :company_visiter, class_name: 'Company', foreign_key: 'company_visiter_id', optional: true
  belongs_to :company_visited, class_name: 'Company', foreign_key: 'company_visited_id', optional: true
end
