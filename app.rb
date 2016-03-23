
# ==========
# soon: ingredients controller
# ==========
get '/ingredients' do
  Ingredient.all.to_json
end

get '/create' do
  @ingredients = Ingredient.new
  @ingredients.name = "apple"
  @ingredients.quantity = 100
  @ingredients.food_group = "fruit"
  @ingredients.save
  Ingredient.all.to_json
end

get '/read' do
  @ingredients = Ingredient.find(1)  # find by id
  "#{@ingredients[:name]} is a fruit, and I have #{@ingredients[:quantity]}"
end

get '/update' do
  @ingredients = Ingredient.find(1)
  @ingredients.quantity = 250
  @ingredients.save
  "Ingredient 1 has been updated"
end

get '/destroy' do
  @ingredients = Ingredient.find(3)
  @ingredients.destroy
  "We destroyed Item number #{@ingredients.id}"
end

# get '/embeddedRuby' do
# @ingredients = Ingredient.find(1)
# erb :embeddedRubyExample
# end

get '/embeddedRubyLoop' do
  @ingredients = Ingredient.all
  erb :embeddedRubyExample
end
