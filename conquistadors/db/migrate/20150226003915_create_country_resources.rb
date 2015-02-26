class CreateCountryResources < ActiveRecord::Migration
  def change
    create_table :country_resources do |t|
      t.references :country, index: true
      t.references :resource, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :country_resources, :countries
    add_foreign_key :country_resources, :resources
  end
end
