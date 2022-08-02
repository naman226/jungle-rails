# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it'should not let the user successfully sign up when password and confirm password feilds do not match' do
      user = User.new(first_name: 'Naman', last_name: 'Dhalla', email: 'naman@gmail.com', password: 'iamking', password_confirmation: 'imking')
      user.save
      expect(user.save).to be_falsey
    end
    
    it'should let the user successfully sign up when password and confirm password feilds are present' do
      user = User.new(first_name: 'Naman', last_name: 'Dhalla', email: 'naman@gmail.com', password: 'iamking', password_confirmation: 'iamking')
      user.save
      expect(user.save).to be_truthy
    end

    it'should throw an error when try to sign up without email, first name or last name' do
      user = User.new(password: 'iamking', password_confirmation: 'iamking')
      user.save
      expect(user.save).to be_falsey
      expect(user.errors.full_messages).to include("Email can't be blank")
      expect(user.errors.full_messages).to include("First name can't be blank")
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it'should have minimum 5 character in password' do
      user = User.new(first_name: 'Naman', last_name: 'Dhalla', email: 'naman@gmail.com', password: 'iam', password_confirmation: 'iam')
      user.save
      expect(user.save).to be_falsey
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      user = User.new(first_name: 'T', last_name: 'Saha', email: 't@gmail.com', password: 'iamhere', password_confirmation: 'iamhere')
      user.save
    end
    # examples for this class method here
    it('should return nil when authenticated') do
      user = User.authenticate_with_credentials('t@gml.com', 'iamhere')
      expect(user).to be_nil
    end

    it('should return user when authenticated') do
      user = User.authenticate_with_credentials('t@gmail.com', 'iamhere')
      expect(user).not_to be_nil
    end
  
    it('should return user when authenticated when email types with spaces') do
      user = User.authenticate_with_credentials('  t@gmail.com', 'iamhere')
      expect(user).not_to be_nil
    end

    it('should return user when authenticated when email types with caps') do
      user = User.authenticate_with_credentials('T@Gmail.com', 'iamhere')
      expect(user).not_to be_nil
    end

    it('should return nil when authenticated when edge cases email with wrong password') do
      user = User.authenticate_with_credentials(' T@Gmail.com', 'iahere')
      expect(user).to be_nil
    end

  end

end
    