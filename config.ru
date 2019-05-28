require 'sinatra/base'

require './controllers/UserController'
require './controllers/ApplicationController'


require './models/UserModel'
require './models/Meal'

map '/users' do
  run UserController  
end

map '/meals' do
  run MealController

end

