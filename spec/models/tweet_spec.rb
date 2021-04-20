require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    user = FactoryBot.create(:user) 
    @tweet = FactoryBot.build(:tweet,user_id: user.id)
  end

describe 'Tweetの保存' do
  context 'Tweetが投稿出来る場合' do
    it '入力内容に不備がない場合、投稿できる' do
      @tweet.valid?
      expect(@tweet).to be_valid
    end
    
  end

  context 'Tweetが保存できない場合' do
    it 'titleがないとTweetは投稿できない' do
      @tweet.title = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("Titleを入力してください")
    end
    it 'textがないとTweetは投稿できない' do
      @tweet.text = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("Textを入力してください")
    end
    it 'textは1000文字以内でないと投稿できない' do
      @tweet.text= ("a" * 1001)
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("Textは1000文字以内で入力してください")
    end
    it 'titleが21文字以上だとTweetは投稿できない' do
      @tweet.title = "あいうえおかきくけこさしすせそたちつてとな"
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("Titleは20文字以内で入力してください")
    end
    it "ユーザーが紐付いていなければTweetが投稿できない" do
      @tweet.user = nil
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("Userを入力してください")
    end
  end
end
end

