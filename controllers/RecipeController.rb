class RecipeController < ApplicationController
   
  before do
    puts "before filter is running"

    if !session[:logged_in]
      # message
      session[:message] = {
        success: false,
        message: "You must be logged in to do that."
      }
      #redirect
      redirect '/users/login'

    end

  end

  # index
  get '/' do
    # get all items from db
    @recipies = Recipe.all
    erb :recipe_index
  end

  # edit
  get '/:id/edit' do
    # get item from db in an instance var
    @recipe = Recipe.find params[:id]
    # render a form with item data
    erb :recipe_edit
  end

  # create
  post '/' do
    # create new item
    new_recipe = Recipe.new
    # set fields
    new_recipe.meal_id = params[:meal_id]
    new_recipe.ingredient_id = params[:ingredient_id]

    new_recipe.save # id is now defined on this instance of the model

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully created #{new_recipe.name} recipe ##{new_recipe.id}"
    }

    # redirect (to index perhaps?)
    redirect '/recipes'
  end

  # new -- 
  get '/new' do
    # just render template that has form
    erb :recipe_new
  end

  # show -- 
    # get item from db in a var
    # render show page with it
  get '/:id' do
    @recipe = Recipe.find params[:id]
    erb :recipe_show
  end
    
  # update 
  put '/:id' do
    # find it
    recipe = Recipe.find params[:id]
    
    # in the API -- be sure to check that the person doing this
    # is logged in and its their item

    # change it
    recipe.name = params[:name]
    recipe.meals_id = params[:meals_id]
    recipe.ingredients_id = params[:ingredients_id]
    # save it
    recipe.save

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully updated recipe ##{recipe.id}"
    }

    # redirect (to item show page maybe? or index maybe?)
    redirect '/recipes'
  end

  # destroy
  delete '/:id' do
    # find it
    recipe = Recipe.find params[:id]
    
    # in the API -- be sure to check that the person doing this
    # is logged in and its their item

    # destroy it
    recipe.destroy

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully destroyed recipe ##{item.id}"
    }

    # redirect (to index perhaps?)
    redirect '/recipes'

  end

  after do
    puts "after filter is running"
  end




end