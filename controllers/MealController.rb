class MealController < ApplicationController

  #list all meals
  get '/' do
    @meals = Meal.all
    erb :meal_index
  end

  #new meal page
  get '/new' do
    erb :meal_new
  end


  #show one meal
  get '/:id' do
    @meal = Meal.find params[:id]
    erb :meal_show
  end
  
  #respond with edit page
  get '/:id/edit' do

    @ing = Ingredient.find params [:id]

    erb :ing_edit
  end

  #make a new meal
  post '/' do 

    newMeal = Meal.new

    newMeal.meal_name = params[:meal_name]
    newMeal.recipe_link_url = params[:recipe_link_url] 
    newMeal.meal_img_url = params[:meal_img_url]
    newMeal.user_id = params[:user_id]

    newMeal.save
  
  end

  #edit a meal
  put '/:id' do
    @meal = Meal.find params[:id]
    erb :edit_meal

  end

  #destroy a meal
  post '/:id/delete' do
    meal = Meal.find params[:id]
    meal.destroy
    redirect '/meals'
  end

end