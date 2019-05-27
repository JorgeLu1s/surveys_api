FactoryBot.define do
  factory :user do
    username { 'userTest' }
    email { "#{username}@surveys.com".downcase }
    password { 'password' }
  end
end
