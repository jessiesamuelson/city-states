require 'rails_helper'

RSpec.describe "TradeDeals", type: :request do
  describe "GET /trade_deals" do
    it "works! (now write some real specs)" do
      get trade_deals_path
      expect(response).to have_http_status(200)
    end
  end
end
