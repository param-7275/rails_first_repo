class User < ApplicationRecord
  has_secure_password 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true ,
    uniqueness: { case_sensitive: false },
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }

  validates :username, presence: :true, uniqueness: :true
  validates :password, presence: true, length: { minimum: 8 }
  validate :password_complexity
  
  private
  def password_complexity
    return unless password
  
    unless password.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+\z/)
      errors.add(:password, "must include at least one lowercase letter, one uppercase letter, one digit, and one special character")
    end
  end
  

  has_many :employees, dependent: :destroy
end
