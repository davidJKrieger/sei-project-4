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

    
    #post ingredient
    post '/' do
    
        new_ing = Ingredient.new
    
        new_ing.name = params[:ingredient_name]
    
        new_ing.save

        redirect '/ingredients'
    end
    
    #edit an ingredient
    get '/:id/edit' do
    
        @ing = Ingredient.find params [:id]
    
        erb :ing_edit
    end
    
    #update
    put '/:id' do
    
        ing = Ingredient.find params[:id]
    
        ing.name = params[:name]
        ing.img_url = params[:img_url]
        ing.img_desc = params[:img_desc]
    
        ing.save
    
        redirect '/ingredients'
    end
    
    
    #destroy an ingredient
    delete '/:id' do
    
        ing = Ingredient.find params[:id]
    
        ing.destroy
        redirect '/ingredients'
    end
end