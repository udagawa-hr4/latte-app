class TweetsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show,:list,:search,:best]
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").first(6)
    @tweet = Tweet.includes(:user).order(impressions_count: 'DESC').first(6)
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
  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments
    # impressionist(@tweet, nil, unique: [:session_hash.to_s])
    impressionist(@tweet, nil, unique: [:impressionable_id, :ip_address])

  end
  def search
    @tweets = Tweet.search(params[:search]).includes(:user).order("tweets.created_at DESC").paginate(page: params[:page], per_page: 9)
  end
  def list
    @tweets = Tweet.includes(:user).order("created_at DESC").paginate(page: params[:page], per_page: 9)
  end
  def best
    @tweets = Tweet.includes(:user).order(impressions_count: 'DESC').paginate(page: params[:page], per_page: 9)
  end
  def edit
    @tweet = Tweet.find(params[:id])
    unless user_signed_in? && current_user.id == @post.user.id
      redirect_to root_path
    end
  end
  def destroy
    @tweet= Tweet.find(params[:id])
    user = @tweet.user_id
    if user_signed_in? && current_user.id == @tweet.user.id
     @tweet.destroy
     redirect_to controller: :users, action: :show, id: user
    else
     redirect_to root_path
    end
  end
  private
  def tweet_params
    params.require(:tweet).permit( :title, :text, images:[]).merge(user_id: current_user.id)
  end
end
