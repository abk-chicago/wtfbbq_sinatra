require 'sinatra/base' # we need sinatra first
require './helpers/colourize'

require './controllers/application' # app.rb
require './controllers/sauce' # SauceController
require './controllers/account' #AccountController

require './models/account'
require './models/ingredient'
require './models/recipe'
require './models/sauce'

# map root resource / to a controller
map('/') { run ApplicationController }
map('/sauce') { run SauceController }
map('/account') { run AccountController }
# map('/lasers') { run LaserssssController }
# map('/hotels') { run HotelsController }
# map('/ingredients') { run IngredientsController }

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

c.log(:red, "wtfbbq App is running!")
c.log(:yellow, "Hope you're hungry!")
# ----------------------------------------
# end here be dragons! code from here on out!
