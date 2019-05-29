class RecipesController < ApplicationController
 
  
  def index
    @recipes = Recipe.all
    erb :ing_all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
     @recipe.save
     redirect '/meals'
 
  end

 def update
    if @recipe.user_id == current_user.id
      if @recipe.update(recipe_params)
        flash[:primary] = "Recipe Info Updated!"
        else
        flash.now[:danger] = "Failed to Update Recipe!"
        erb :edit
      end
   
  end

  def destroy
    if @recipe.user_id == current_user.id
      @recipe.destroy!
      flash[:primary] = "Recipe Deleted!"
      redirect '/meals'
    else
      flash[:danger] = "You can only Delete Your Own Recipe!"
      redirect '/meals'
    end
  end
end