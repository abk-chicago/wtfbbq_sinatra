# our boy app.rb is allll grown up ;)
# /tear - so proud
class ApplicationController < Sinatra::Base

  @account_message = ""

  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'omg_wtfbbq_app_sinatra'
  )

  # allow static files to be put in /public and hosted at localhost/*
  set :public_folder, File.expand_path('../../public', __FILE__)
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  # try using c.log(:blue, "some text")
  c = Colourize.new

  not_found do
    erb :notfound
  end

  get '/' do
    @account_message = "Something every time you load here..."
    c.log(:magenta, "Hey! You loaded the base resource route! whoa!")
    erb :index
  end

end
