require './helpers/colourize'

require './app'

require './models/account'
require './models/ingredient'
require './models/recipe'

run Sinatra::Application

# try using c.log(:blue, "some text")
c = Colourize.new

# here be dragons - this is just setup stuff to make your life easier
# ----------------------------------------
# before filter on each request
before '/*' do
  c.log(:cyan, "--------------------------")
  c.log(:cyan, "Request received by the server!")
  c.log(:green, "Host: " + request.host + request.path)
  c.log(:green, "Params: " + params.to_s)
  c.log(:cyan, "--------------------------")
end
# after filter on each request
after '/*' do
  c.log(:blue, "--------------------------")
  c.log(:blue, "Response sent from server!")
  c.log(:aliceblue, "Status: " + response.status.to_s)
  c.log(:aliceblue, "Response: " + response.body.to_s)
  c.log(:blue, "--------------------------")

end
# allow static files to be put in /public and hosted at localhost/*
set :public_folder, File.dirname(__FILE__) + '/public'
# set folder for templates to ../views, but make the path absolute
set :views, File.dirname(__FILE__) + '/views'
c.log(:red, "wtfbbq App is running!")
c.log(:yellow, "Hope you're hungry!")
# ----------------------------------------
# end here be dragons! code from here on out!
