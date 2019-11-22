require 'json'
require 'open-uri'

puts 'Start seeds'

Dose.destroy_all
puts 'Doses table dropped'
Ingredient.destroy_all
puts 'Ingredient table dropped'
Cocktail.destroy_all
puts 'Cocktails table dropped'

puts '-> Start ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
puts "#{Ingredient.count} ingredients imported."

puts 'End ingredients'

puts '->  Start cocktails'

url_mojito      = 'https://res.cloudinary.com/flexishore/image/upload/v1574431219/mister-coktail/Mojito_nc1p6f.jpg'
url_long_island = 'https://res.cloudinary.com/flexishore/image/upload/v1574431224/mister-coktail/long-island_ubhgmb.jpg'
url_mushi_tonic = 'https://res.cloudinary.com/flexishore/image/upload/v1574431218/mister-coktail/mushi-tonic_k4whz1.jpg'
url_bier_mayo   = 'https://res.cloudinary.com/flexishore/image/upload/v1574431217/mister-coktail/biere-frites_mxkdac.jpg'

mojito = Cocktail.new(
  name: 'Mojito',
  description: 'Libero vero beatae voluptate asperiores, placeat nemo dignissimos, repellat suscipit deleniti minima nam nihil pariatur optio facilis doloremque doloribus. Porro, similique, aut.')
mojito.remote_photo_url = url_mojito
mojito.save!

long_island = Cocktail.new(
  name: 'Long Island',
  description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt rem maiores at.')
long_island.remote_photo_url = url_long_island
long_island.save!

mushi_tonic = Cocktail.new(
  name: 'Mushi Tonic',
  description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi quae doloribus obcaecati recusandae aliquid facere, non sed quaerat neque laudantium voluptas ab animi suscipit quia error eius iusto! Perspiciatis, assumenda?')
mushi_tonic.remote_photo_url = url_mushi_tonic
mushi_tonic.save!

bier_mayo = Cocktail.new(
  name: 'Bière Mayo',
  description: 'Le booster de votre petit déj')
bier_mayo.remote_photo_url = url_bier_mayo
bier_mayo.save!

puts "#{Cocktail.count} cocktails imported."

puts 'End Cocktails'

puts '-> Start doses'

doses = [
  {
    description: '3cl',
    ingredient: Ingredient.first,
    cocktail: Cocktail.first
  },
  {
    description: '1L',
    ingredient: Ingredient.last,
    cocktail: Cocktail.first
  }
]

Dose.create!(doses)
puts "#{Dose.count} doses imported."

puts 'End Doses'

puts 'End seeds'
