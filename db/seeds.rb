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

cocktails = [
  { name: 'Mojito' },
  { name: 'Long Island' },
  { name: 'Mushi Tonic' },
  { name: 'Bière Mayo' }
]
Cocktail.create!(cocktails)
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
