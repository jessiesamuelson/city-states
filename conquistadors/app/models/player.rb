class Player < ActiveRecord::Base


  # Secure Session
  # def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  # end

  has_secure_password 
  has_one :country, dependent: :destroy

  validates :email, :password_digest, presence: :true
  validates :email, uniqueness: :true
  
end

