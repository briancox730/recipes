require 'sinatra'
require_relative 'helpers.rb'

get '/' do

redirect '/recipes'
end

get '/recipes' do
  @recipes = get_recipes
  @title = "Recipes Index"

  erb :'index.html'
end

get '/recipes/:id' do
  @recipe_id = params[:id]
  @recipe_details = get_recipe_detail(@recipe_id)

  erb :'show.html'
end
