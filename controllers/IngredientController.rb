class IngredientController < ApplicationController

    #Index: All of the ingredients for all users and recipes 
    get '/' do
        @ing = Ingredient.all
    
        erb :ing_all
    end

    get '/new' do
        
        erb :ing_new
        
    end
    
    #show an ingredient
    get '/:id' do
        @ing = Ingredient.find params [:id]
        
        erb :ing_show
    end
    
    #add an ingredient
    get '/new' do
    erb :ingredient_new
    end

    
    #post ingredient
  #POST #make a new meal
  post '/' do 
    newIng = Ingredient.new

    newIng.ingredient_name = params[:ingredient_name]
    newIng.save

    redirect '/ingredients'
  
  end
 
    #edit an ingredient
    get '/:id/edit' do
    
        @ing = Ingredient.find params[:id]
    
        erb :ing_edit
    end
    
    #update
    put '/:id' do

    ingredient = Ingredient.find params[:id]
    ingredient.ingredient_name = params[:ingredient_name]
    ingredient.save

        redirect '/ingredients'
    end
    
    
    #destroy an ingredient
    delete '/:id' do
    
        ing = Ingredient.find params[:id]
    
        ing.destroy
        redirect '/ingredients'
    end
end