require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'omg_wtfbbq_app_sinatra'
)

# try using c.log(:blue, "some text")
c = Colourize.new

# global app variables
@account_message = ""
@is_user_logged_in = false
# end global app variables

not_found do
  erb :notfound
end

get '/' do
  @account_message = "Welcome to WTFBBQ!"
  c.log(:magenta, "Hey! You loaded the base resource route! whoa!")
  erb :index
end

# ==========
# soon: Accounts controller
# ==========

get '/account' do
  p 'This is the account login/register page'
  @account_message = "Welcome! Please register or login!"
  erb :account_create
end

get '/account/logout' do
  @account_message = "THANK YOU FOR VISITING US! PLZ COME BACK TYYYYY!"
  redirect '/'
end

get '/account/update' do
  @account_message = "Did you move? We need to track.. err help you!"
  erb :account_update
end

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
