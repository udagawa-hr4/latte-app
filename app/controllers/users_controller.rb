class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("tweets.created_at DESC").paginate(page: params[:page], per_page: 8)
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if user_signed_in? && @user.id == current_user.id
      if @user.update(profile_params)
      redirect_to user_path(@user.id)
      else
      redirect_to action: :show
      end
    else
      redirect_to root_path
    end 
  end
  private
  def profile_params
    params.require(:user).permit(:introduction,:name)
  end
end
