class CountryResource < ActiveRecord::Base
  belongs_to :country
  belongs_to :resource

  has_many :trade_deals
end
