# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      username { 'test_user' }
      email { 'test@example.com' }
      password { 'Test@123' }
      # other attributes...
    end
  end
  