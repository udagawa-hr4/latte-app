class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
  def new
    @tweet = Tweet.new
   
  end
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end
  def search
    @tweets = Tweet.search(params[:search]).includes(:user).order("tweets.created_at DESC").paginate(page: params[:page], per_page: 9)
  end
  def list
    @tweets = Tweet.includes(:user).order("created_at DESC").paginate(page: params[:page], per_page: 9)
  end
  private
  def tweet_params
    params.require(:tweet).permit( :title, :text, images:[]).merge(user_id: current_user.id)
  end
end
