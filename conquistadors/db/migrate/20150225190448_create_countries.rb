class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.references :player, index: true
      t.string :flag
      t.string :motto
      t.integer :population
      t.float :employment
      t.float :tax_rate
      t.float :wealth

      t.timestamps null: false
    end
    add_foreign_key :countries, :players
  end
end
