class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @post = Post.find(params[:id])
    num = @post.user_id
    @max_resuld = Post.where(user_id: num).maximum(:fishing_result)
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to root_path if @post.user_id != current_user.id
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end






  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_text, :fishing_result, :place_id, :water_depth_id, :weather_id, :feed_id,
                                 :image).merge(user_id: current_user.id)
  end
end
