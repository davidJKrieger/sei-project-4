require 'sinatra/base'
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/MealController'
require './controllers/IngredientController'
require './controllers/RecipeController'

require './models/User'
require './models/Meal'
require './models/Ingredient'
<<<<<<< HEAD
require './models/Recipe'
=======
require './models/recipe'
>>>>>>> 92c43352f54093ffa48bbfbe8224da902979fb02


map ('/') {
  run ApplicationController
}
map ('/users') {
  run UserController
}
map ('/meals') {
  run MealController
}
map ('/ingredients') {
  run IngredientController
}
map ('/recipes') {
  run RecipeController
<<<<<<< HEAD
}
=======
}

>>>>>>> 92c43352f54093ffa48bbfbe8224da902979fb02
