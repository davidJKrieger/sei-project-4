class MealController < ApplicationController

  before do
    puts "before filter is running"

    if !session[:logged_in]
      # message
      session[:message] = {
        success: false,
        status: "neutral",
        message: "You must be logged in to do that."
      }
      #redirect
      redirect '/users/login'

    end

  end

  get '/meals' do
    "Hello from meals"


  end


end