class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.float :growth_factor
      t.float :exchange_rate

      t.timestamps null: false
    end
  end
end
