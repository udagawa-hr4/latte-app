FactoryBot.define do
  factory :user do
    name{"udagawa"}
    email{"test@test.com"}
    password{"test1234"}
    password_confirmation { password }
    
  end
end
