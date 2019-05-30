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
    #destroy a meal
  delete '/:id' do
    meal = Meal.find params[:id]
    meal.destroy
    redirect '/meals'
  end

  #POST #make a new meal
  post '/' do 
    newMeal = Meal.new

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
end