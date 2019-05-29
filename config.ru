require 'sinatra/base'
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/MealController'
require './controllers/IngredientController'

require './models/User'
require './models/Meal'
require './models/Ingredient'


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
