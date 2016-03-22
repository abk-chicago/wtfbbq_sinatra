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
  @account_message = "Something every time you load here..."
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

post '/account/login' do
  # assume this worked!
  @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
  @all_users.each do |user|
    c.log(:yellow, user.to_s)
  end
  redirect '/'
end

get '/account/logout' do
  @account_message = "THANK YOU FOR VISITING US! PLZ COME BACK TYYYYY!"
  redirect '/'
end

post '/account/create' do
  #binding.pry
  @is_user_duplicate = true
  if (params[:password] != params[:password_conf])
    status 403
  end

  @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
  @all_users.each do |user|
    c.log(:yellow, user.to_s)
    if (user.email == params[:email])
      status 403
    end
  end

  @new_user = Account.create({
    :name => params[:name],
    :email => params[:email],
    :password_hash => params[:password].to_s.reverse # do not irl srs
  })
  # @new_user = Account.new
  # @new_user.name = params[:name]
  # @new_user.email = params[:email]
  @new_user.save
  redirect '/'
end

get '/account/update' do
  @old_email = "james@codeforcoffee.org"
  @account_message = "Did you move? We need to track.. err help you!"
  erb :account_update
end

post '/account/update' do
  @all_users = Account.all # this kinda sucks IRL but SOOOOONNN
  @all_users.each do |user|
    c.log(:yellow, user.to_s)
  end
end

get '/account/all' do
  @all_users = Account.all
  erb :account_all
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
