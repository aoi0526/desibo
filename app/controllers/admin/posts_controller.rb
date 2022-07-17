class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path
    else
      redirect_to admin_posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:detail, post_images: [])
  end
end
