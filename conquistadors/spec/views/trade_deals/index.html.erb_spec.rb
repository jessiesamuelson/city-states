require 'rails_helper'

RSpec.describe "trade_deals/index", type: :view do
  before(:each) do
    assign(:trade_deals, [
      TradeDeal.create!(
        :player => nil,
        :country_resource => nil,
        :cost => 1.5,
        :quantity => 1.5,
        :agreed => false
      ),
      TradeDeal.create!(
        :player => nil,
        :country_resource => nil,
        :cost => 1.5,
        :quantity => 1.5,
        :agreed => false
      )
    ])
  end

  it "renders a list of trade_deals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
