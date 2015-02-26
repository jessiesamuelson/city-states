require 'rails_helper'

RSpec.describe "trade_deals/edit", type: :view do
  before(:each) do
    @trade_deal = assign(:trade_deal, TradeDeal.create!(
      :player => nil,
      :country_resource => nil,
      :cost => 1.5,
      :quantity => 1.5,
      :agreed => false
    ))
  end

  it "renders the edit trade_deal form" do
    render

    assert_select "form[action=?][method=?]", trade_deal_path(@trade_deal), "post" do

      assert_select "input#trade_deal_player_id[name=?]", "trade_deal[player_id]"

      assert_select "input#trade_deal_country_resource_id[name=?]", "trade_deal[country_resource_id]"

      assert_select "input#trade_deal_cost[name=?]", "trade_deal[cost]"

      assert_select "input#trade_deal_quantity[name=?]", "trade_deal[quantity]"

      assert_select "input#trade_deal_agreed[name=?]", "trade_deal[agreed]"
    end
  end
end
