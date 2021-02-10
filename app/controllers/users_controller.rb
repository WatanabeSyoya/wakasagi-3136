class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @max_fishing_result = Post.where(user_id: @user.id).maximum(:fishing_result)
    @max_fishing_result_details = Post.find_by fishing_result: @max_fishing_result, user_id: @user.id
    @posts = @user.posts
    @post = Post.find(params[:id])
  end
end
