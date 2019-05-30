class RecipeController < ApplicationController
   
  # before do
  #   puts "before filter is running"

  #   if !session[:logged_in]
  #     # message
  #     session[:message] = {
  #       success: false,
  #       message: "You must be logged in to do that."
  #     }
  #     #redirect
  #     redirect '/users/login'

  #   end

  # end

  # index
  get '/' do
    @recipies = Recipe.all
    erb :recipe_index
  end

  # edit
  get '/:id/edit' do
    @recipe = Recipe.find params[:id]
    erb :recipe_edit
  end

  # create
  post '/' do
    new_recipe = Recipe.new
    new_recipe.meal_id = params[:meal_id]
    new_recipe.ingredient_id = params[:ingredient_id]

    new_recipe.save 

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully created #{new_recipe.name} recipe ##{new_recipe.id}"
    }
    redirect '/recipes'
  end

  # new -- 
  get '/new' do
    erb :recipe_new
  end

  # show 
  get '/:id' do
    @recipe = Recipe.find params[:id]
    erb :recipe_show
  end
    
  # update 
  put '/:id' do

    recipe = Recipe.find params[:id]
    
    recipe.name = params[:name]
    recipe.meals_id = params[:meals_id]
    recipe.ingredients_id = params[:ingredients_id]
    recipe.save

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully updated recipe ##{recipe.id}"
    }
    redirect '/recipes'
  end

  # destroy
  delete '/:id' do
    recipe = Recipe.find params[:id]
    recipe.destroy

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully destroyed recipe ##{item.id}"
    }

    redirect '/recipes'

  end

  # after do
  #   puts "after filter is running"
  # end




end