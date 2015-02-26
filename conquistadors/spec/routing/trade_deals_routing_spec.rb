require "rails_helper"

RSpec.describe TradeDealsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trade_deals").to route_to("trade_deals#index")
    end

    it "routes to #new" do
      expect(:get => "/trade_deals/new").to route_to("trade_deals#new")
    end

    it "routes to #show" do
      expect(:get => "/trade_deals/1").to route_to("trade_deals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trade_deals/1/edit").to route_to("trade_deals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trade_deals").to route_to("trade_deals#create")
    end

    it "routes to #update" do
      expect(:put => "/trade_deals/1").to route_to("trade_deals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trade_deals/1").to route_to("trade_deals#destroy", :id => "1")
    end

  end
end
