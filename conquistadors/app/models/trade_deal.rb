class TradeDeal < ActiveRecord::Base
  belongs_to :player
  belongs_to :country_resource

  before_create :set_agreed_to_false

  

  # all trade deals begin as false and the creator cannot modify 'agreed' boolean 
  def set_agreed_to_false
    self.agreed = false
    return true
  end

end
