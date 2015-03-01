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

# -- Jessie
jessie = Player.create!({
  name: 'Jessie',
  title: 'Conquistadora',
  email: 'jessie@gmail.com',
  password: '11111'
})

# -- Barbados
barbados = Country.create!({
  name: "Barbados.png",
  player_id: 1,
  motto: "Go home early!",
  employment: 78.9,
  tax_rate: 12.6
  })

# -- Remina
remina = Player.create!({
  name: 'Remina',
  title: 'Czarina',
  email: 'remina@gmail.com',
  password: '11111'
  })

# -- Kyrgyzstan
kyrgyzstan = Country.create!({
  name: "Kyrgyzstan.png",
  player_id: 2,
  motto: "We own the sun!",
  employment: 65.3,
  tax_rate: 3.4
  })
