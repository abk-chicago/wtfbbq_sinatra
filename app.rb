require 'bundler'
Bundler.require

# connect to DB using ActiveRecord
ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "omg_wtfbbq_app_sinatra"
)

# try using c.log(:blue, "some text")
c = Colourize.new

not_found do
  erb :notfound
end

get '/' do
  c.log(:magenta, "Hey! You loaded the base resource route! whoa!")
  erb :index
end

# trying ActiveRecord
get '/ingredients' do
  Ingredient.all.to_json
end
