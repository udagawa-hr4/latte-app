require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user) 
    @tweet = FactoryBot.create(:tweet, user_id: user.id)
    @comment = FactoryBot.build(:comment, user_id: user.id, tweet_id: @tweet.id)
    # sleep 3
  end
  describe 'Commentの保存' do
    context 'Commentが投稿出来る場合' do
      it '入力内容に不備がない場合、投稿できる' do
        @comment.valid?
        expect(@comment).to be_valid
      end
    end

    context 'Commentが保存できない場合' do
      it 'textがないとCommentは投稿できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
      it "ユーザーが紐付いていなければCommentが投稿できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      # it "Tweetが紐付いていなければCommentが投稿できない" do
      #   @comment.user = nil
      #   @comment.valid?
      #   expect(@comment.errors.full_messages).to include("")
      # end
    end
  end

end
