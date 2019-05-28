require 'sinatra/base'

require './controllers/UserController'


require './models/UserModel'

map '/api/v1/users' do
  run UserController  
end