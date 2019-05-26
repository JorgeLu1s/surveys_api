FactoryBot.define do
  factory :user do
    username {'user' }
    email { "#{username}@surveys.com".downcase }
    password { 'password' }
  end
end
