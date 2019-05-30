class RecipeController < ApplicationController
<<<<<<< HEAD

  #index
  #list all meals
  get '/' do
    @meals = Meal.all
    erb :meal_index
  end

  #create
  #new meal page
  get '/new' do
    erb :meal_new
=======
   
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
>>>>>>> 92c43352f54093ffa48bbfbe8224da902979fb02
  end
    #destroy a meal
  delete '/:id' do
    meal = Meal.find params[:id]
    meal.destroy
    redirect '/meals'
  end

  #POST #make a new meal
  post '/' do 
    newMeal = Meal.new

<<<<<<< HEAD
    newMeal.meal_name = params[:meal_name]
    newMeal.recipe_link_url = params[:recipe_link_url] 
    newMeal.meal_img_url = params[:meal_img_url]
    newMeal.user_id = params[:user_id]

    newMeal.save
  
  end

  #show one meal
  get '/:id' do
    @meal = Meal.find params[:id]
    erb :meal_show
  end
  
  #respond with edit page
  get '/:id/edit' do
    @meal = Meal.find params[:id]
    erb :meal_edit
  end
  #Update Meal
  put '/:id' do
    meal = Meal.find params[:id]
    meal.meal_name = params[:meal_name]
    meal.meal_img_url = params[:meal_img_url]
    meal.recipe_link_url = params[:recipe_link_url]
    meal.save
    redirect '/meals'
  end 
  #edit a meal
=======
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




>>>>>>> 92c43352f54093ffa48bbfbe8224da902979fb02
end