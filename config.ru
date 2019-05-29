require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/UserController'




require './models/UserModel'
require './models/Meal'
require './models/Ingredient'

map ('/') {
  run ApplicationController
}
map ('/users') {
  run UserController
}


# map ('/meals') {
#   run MealController
<<<<<<< HEAD
=======

# }
>>>>>>> 63287849b2a6bb0642e2ec85085ab39f85f7c263

# }