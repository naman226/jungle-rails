class User < ApplicationRecord
  
  def self.authenticate_with_credentials(email, password) 
    user = User.find_by(:email => email.strip.downcase)
    if user.present? && user.authenticate(password)
      user
    else
      nil
    end
  end

  has_secure_password
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, length: { minimum: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  # def self.authenticate
  # end 

end
