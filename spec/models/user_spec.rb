# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(username: 'test_user', email: 'test@gmail.com', 
                    password: 'Test@123', password_confirmation: 'Test@123')
    expect(user).to be_valid
  end

  it 'is not valid without an username' do
    user = User.new(username: 'test_user')
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: 'test@gmail.com')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: 'Test@123')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password confirmation' do
    user = User.new(password_confirmation: 'Test@123')
    expect(user).to_not be_valid
  end
end

