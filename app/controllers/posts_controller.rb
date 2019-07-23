class PostsController < ApplicationController
  def new
    redirect_to '/' if session[:user_id] == nil
    @post = Post.new
  end

  def create
    redirect_to '/' if session[:user_id] == nil
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id]).name if session[:user_id] != nil
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
