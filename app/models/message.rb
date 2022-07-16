class Message < ApplicationRecord
  belongs_to :room
  belongs_to :company, optional: true # belongs_toのnull制約を許容する
  belongs_to :user, optional: true # belongs_toのnull制約を許容する

  validates :body, presence: true

  def user_create_notification_message!(current_user, company_visited_id, message_id)
    notification = current_user.active_notifications.new(
      company_visited_id: company_visited_id,
      action: "user_message",
      message_id: message_id
    )
    notification.save if notification.valid?
  end

  def company_create_notification_message!(current_company, user_visited_id, message_id)
    notification = current_company.active_notifications.new(
      user_visited_id: user_visited_id,
      action: "company_message",
      message_id: message_id
    )
    notification.save if notification.valid?
  end
end
