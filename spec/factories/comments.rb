FactoryBot.define do
  factory :comment do
    
    text {"テストテキスト"}
    user_id {1}
    tweet_id {1}
    id {1}

    association :user
    association :tweet
  end
end
