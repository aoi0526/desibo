class Company::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.company_id = current_company.id
    if @post.save
      redirect_to company_post_path(@post)
    else
      redirect_to new_company_post_path
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to company_post_path(@post)
    else
      redirect_to edit_company_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to company_posts_path
    else
      redirect_to edit_company_post_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:post_image, :detail)
  end
end
