class Company::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    like.save

    @post.create_notification_by(current_user, @post.company_id)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end

end
