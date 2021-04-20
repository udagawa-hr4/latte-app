FactoryBot.define do
  factory :tweet do
    title {"テストタイトル"}
    text {"テストコンテント"}
    user_id {1}
    id {1}
    association :user
    after(:build) do |tweet|
      tweet.images.attach(io: File.open('public/images/coffee-618858_1920.jpg'), filename: 'coffee-618858_1920.jpg')
    end
    
  end
end
