class TradeDeal < ActiveRecord::Base
  belongs_to :player
  belongs_to :country_resource

  before_create :set_agreed_to_false

  after_update :enact_trade

  

  # all trade deals begin as false and the creator cannot modify 'agreed' boolean 
  def set_agreed_to_false
    self.agreed = nil
  end

  def enact_trade

    if self.agreed 

      buyer = self.player.country
      seller = self.country_resource.country

      

      # Money exchanges occur before exchange of goods
      buyer.wealth -= self.cost
      seller.wealth += self.cost

      # Exchange of goods
      item = self.country_resource.resource

      has_item = buyer.country_resources.find do |cr|
        cr.resource_id == item.id
      end
      

      if has_item 
        item_to_add = buyer.country_resources.find_by(resource_id: item.id)
        item_to_add.quantity += self.quantity
        item_to_add.save
        item_to_subtract = seller.country_resources.find_by(resource_id: item.id)
        item_to_subtract.quantity -= self.quantity
        item_to_subtract.save
      else
        buyer.country_resources.new(resource_id: item.id, quantity: self.quantity)
      end
    end

    buyer.save
    seller.save
  end
end
