class IngredientsController < ApplicationController
	# C - Create a new ingredient
	post '/' do
		# params available in here
		Ingredient.create(params['name'], ...)
	end


	# R - List all ingredients
	get '/' do
		erb :ingredients
	end
end