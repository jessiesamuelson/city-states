require 'rails_helper'


RSpec.describe StaticHelper, type: :helper do

  it "can generate a page title" do
    expect(helper.page_title).to eq "City States"
  end

  it "generates the right title give a @title String" do
    @title = "Index"
    expect(helper.page_title).to eq "City States - Index"
  end

  it "generates the right title given a @title Array" do
    @title = ["Players", "Remina"]
    expect(helper.page_title).to eq "City States - Players - Remina"
  end


end