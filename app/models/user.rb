class User < ApplicationRecord
  has_secure_password validation: true
  validates :mail, presence: true, uniqueness: true
  has_many :scores, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
  
  def sign_out
    cookies.delete(:user_remember_token)
  end
  
end
