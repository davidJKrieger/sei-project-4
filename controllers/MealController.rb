class MealController < ApplicationController

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
    newMeal.save

    redirect '/meals'
  
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
