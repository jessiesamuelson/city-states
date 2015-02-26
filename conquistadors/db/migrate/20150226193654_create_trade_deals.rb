class CreateTradeDeals < ActiveRecord::Migration
  def change
    create_table :trade_deals do |t|
      t.references :player, index: true
      t.references :country_resource, index: true
      t.float :cost
      t.float :quantity
      t.boolean :agreed

      t.timestamps null: false
    end
    add_foreign_key :trade_deals, :players
    add_foreign_key :trade_deals, :country_resources
  end
end
