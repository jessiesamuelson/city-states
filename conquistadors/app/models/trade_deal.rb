class TradeDeal < ActiveRecord::Base
  belongs_to :player
  belongs_to :country_resource
end
