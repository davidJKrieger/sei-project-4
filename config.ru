require 'sinatra/base'

require './controllers/UserController'
require './controllers/ApplicationController'


require './models/UserModel'
require './models/Meal'

map ('/') {
  run ApplicationController
}
map ('/users') {
  run UserController
}


map ('/meals') {
  run MealController

}

