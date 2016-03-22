require 'bundler'
Bundler.require

# try using c.log(:blue, "some text")
c = Colourize.new

not_found do
  erb :notfound
end

get '/' do
  c.log(:magenta, "Hey! You loaded the base resource route! whoa!")
  erb :index
end
