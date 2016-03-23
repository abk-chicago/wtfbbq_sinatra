class SauceController < ApplicationController

  #localhost/sauce/
  get '/' do
    Sauce.all.to_json
  end

  get '/create' do
    Sauce.create({
      :name => 'St. Louis BBQ Sauce',
      :where_from => 'St. Louis'
    }).to_json
  end

end
