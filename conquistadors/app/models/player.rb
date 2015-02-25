class Player < ActiveRecord::Base

  has_secure_password 
  has_one :country, dependent: :destroy

  validates :email, :password_digest, presence: :true
  validates :email, uniqueness: :true
  
end

