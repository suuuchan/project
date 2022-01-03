class PostsController < ApplicationController
  def new
     @post = Post.new
  end
  
  def index
    @posts = Post.all.order(created_at: "DESC")
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
