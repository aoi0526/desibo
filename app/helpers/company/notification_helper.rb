module Company::NotificationHelper

  def notification_form(notification)
	  case notification.action
	    when "like" then
	      tag.a(notification.user_visiter.name, href:user_user_path(notification.user_visiter_id), style:"font-weight: bold; color: #ffffff;")+"さんが"+tag.a('あなたの投稿', href:company_post_path(notification.post_id), style:"font-weight: bold; color: #ffffff;")+"にいいねしました!"
	    when "user_message" then
	    	tag.a(notification.user_visiter.name, href:user_user_path(notification.user_visiter_id), style:"font-weight: bold; color: #ffffff;")+"さんが"+tag.a('あなたにメッセージ', href:company_room_path(notification.message.room_id), style:"font-weight: bold; color: #ffffff;")+"を送りました!"
	    when "company_message" then
	    	tag.a(notification.company_visiter.name, href:company_company_path(notification.company_visiter_id), style:"font-weight: bold; color: #ffffff;")+"さんが"+tag.a('あなたにメッセージ', href:user_room_path(notification.message.room_id), style:"font-weight: bold; color: #ffffff;")+"を送りました!"
	  end
  end

  def company_unchecked_notifications
    @notifications = current_company.passive_notifications.where(checked: false)
  end

  def user_unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
