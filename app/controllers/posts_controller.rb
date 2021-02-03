class PostsController < ApplicationController



  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_text, :place_id, :fishing_result_id, :water_depth_id, :weather_id, :feed_id, :image).merge(user_id: current_user.id)
  end


end
