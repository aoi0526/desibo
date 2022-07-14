module Company::NotificationHelper

  def notification_form(notification)
	  @visiter = notification.user_visiter
	  #notification.actionがfollowかlikeかcommentか
	  case notification.action
	    when "like" then
	      tag.a(notification.user_visiter.name, href:user_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:company_post_path(notification.post_id), style:"font-weight: bold;")+"にいいねしました"
	    when "message" then
	    	# @comment = Comment.find_by(id: @visiter_comment)&.content
	    	# tag.a(@visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にコメントしました"
	  end
  end
end
