class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require()

  enable :sessions


  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'whats_for_dinner'
  )

  use Rack::MethodOverride
  set :method_override, true
  
  set :views, File.expand_path('../../views', __FILE__)

  # # teach it how to find static assets
  # set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do 
      "here I am!"
    # redirect '/meals'
  end

  get '/test' do
    some_text = "TEST 123"
    binding.pry 
    "pry has finished -- here's some_text #{some_text}"

  end

  get '*' do
  halt 404
  end

end
