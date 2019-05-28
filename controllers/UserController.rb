class UserAPIController < ApplicationController

before do
  if request.post
    payload_body = request.body.read
    @payload = JSON.parse(payload_body).symbolize_keys
    puts "------->   Here is our payload, Json request body"
    pp @payload
  end

end

  post '/login' do
    user = User.find_by username: params[:username]
    pw = params[:password]
    if user && user.authenticate(pw)
    session[:logged_in] = true
    session[:username] = user.username
    response = {
        success: true, 
        code: 200,
        status: "good",
        message: "User #{user.username} successfully logged in." 
      }
      response.to_json
      
    else
     
      response = {
        success: false,
        code: 200,
        status: "bad",
        message: "Invalid username or password."
      }
    response.to_json

    end

  end


 
  post '/register' do

    user = User.find_by username: params[:username]
    if !user
     user = User.new
    user.username = params[:username]
    user.password = params[:password]
      user.save
      session[:logged_in] = true
      session[:username] = user.username

      # API response
      response = {
        success: true,
        code: 201, 
        status: "good",
        message: "User #{user.username} successfully created"
      }

      response.to_json
      
    else 
     
      response = {
        success: false,
        code: 200, 
        status: "bad",
        message: "Sorry, username #{params[:username]} is already taken."
      }

      response.to_json
      
    end

  end

  get '/logout' do
    
    username = session[:username] 
    session.destroy
     response = {
      success: true,
      code: 200,
      status: "neutral",
      message: "User #{username} logged out." 
    }

    response.to_json


  end

end