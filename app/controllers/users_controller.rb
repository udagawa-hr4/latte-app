class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("tweets.created_at DESC").paginate(page: params[:page], per_page: 8)
  end
  private
  def profile_params
    params.require(:user).permit(:introduction,:name)
  end
end
