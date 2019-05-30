require 'sinatra/base'
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/MealController'
require './controllers/IngredientController'
require './controllers/RecipeController'

require './models/User'
require './models/Meal'
require './models/Ingredient'
require './models/Recipe'


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
}