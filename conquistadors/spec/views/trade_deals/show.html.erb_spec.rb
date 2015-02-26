require 'rails_helper'

RSpec.describe "trade_deals/show", type: :view do
  before(:each) do
    @trade_deal = assign(:trade_deal, TradeDeal.create!(
      :player => nil,
      :country_resource => nil,
      :cost => 1.5,
      :quantity => 1.5,
      :agreed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
  end
end
