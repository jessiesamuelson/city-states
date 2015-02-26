require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  it 'shows the index' do
    expect { get :index }.not_to raise_error
  end
end