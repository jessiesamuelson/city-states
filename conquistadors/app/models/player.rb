class Player < ActiveRecord::Base


  # Secure Session
  # def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  # end

  has_secure_password 
  has_one :country, dependent: :destroy
  has_many :trade_deals

  validates :email, :password_digest, presence: :true
  validates :email, uniqueness: :true

  def self.find_by_trade_deal(deal)
    country_resource = CountryResource.find(deal.country_resource_id)
    country = Country.find(country_resource.country_id)
    player =Player.find(country.player_id)
  end
  
end

