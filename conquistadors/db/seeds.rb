# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv = CSV.open('db/resources.csv', 'r', headers: true, header_converters: :symbol)

csv.map do |row|
  Resource.create({name: row[:name], growth_factor: row[:growth_factor], exchange_rate: row[:exchange_rate]})
end
