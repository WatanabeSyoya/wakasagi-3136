class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @fishing_result_sum = Post.where(user_id: @user.id).sum(:fishing_result)
    @max_fishing_result = Post.where(user_id: @user.id).maximum(:fishing_result)
    @max_fishing_result_details = Post.find_by fishing_result: @max_fishing_result, user_id: @user.id
    @posts = @user.posts
  end
end
