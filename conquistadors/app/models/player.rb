class Player < ActiveRecord::Base

  has_secure_password 
  has_one :country
  
end

