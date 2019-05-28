class UserAPIController < ApplicationController

before do
  if request.post
    payload_body = request.body.read
    @payload = JSON.parse(payload_body).symbolize_keys

    puts "------->   Here is our payload, Json request body"
    pp @payload
  end

end



  # login 
  post '/login' do

    # find user by username
    user = User.find_by username: params[:username]

    # pp user # help us as devs see whether its a username or pw issue
    # or you could use binding.pry

    pw = params[:password]

    # if the user exists and password is correct --
    # password is now being checked using bcrypt
    if user && user.authenticate(pw)
      # add stuff to session: loggedin, username, message
      session[:logged_in] = true
      session[:username] = user.username

      response = {
        success: true, 
        code: 200,
        status: "good",
        message: "User #{user.username} successfully logged in." 
      }
      response.to_json

    # else 
    else
      # error -- incorrect un or pw
      response = {
        success: false,
        code: 200,
        status: "bad",
        message: "Invalid username or password."
      }

      response.to_json

    end

  end


  # do registration
  post '/register' do

    # check if user exists 
    user = User.find_by username: params[:username]
          # User.find_by({ :username => params[:username] })

    # if user doesn't exist
    if !user

      # create user 
      user = User.new
      user.username = params[:username]

      # HEY: if has_secure_password is specified in User model
      # .password= setter method will automatically encrypt
      # the password for you and store it in a field on the 
      # User model called "password_digest"
      user.password = params[:password]

      user.save

      # add stuff to session: loggedin, username, message
      session[:logged_in] = true
      session[:username] = user.username

      # API response
      response = {
        success: true,
        code: 201, # this does not actually set the status code, 
                   # it's just something you might wish to include
        status: "good",
        message: "User #{user.username} successfully created"
      }

      response.to_json

    # else if user does exist
    else 
      # session message -- username taken
      response = {
        success: false,
        code: 200, # this does not actually set the status code, 
                   # it's just something you might wish to include
        status: "bad",
        message: "Sorry, username #{params[:username]} is already taken."
      }

      response.to_json
      
    end

  end

  # logout
  get '/logout' do
    
    username = session[:username] # grab username before destroying session...

    session.destroy

    response = {
      success: true,
      code: 200,
      status: "neutral",
      message: "User #{username} logged out." #...so that we can use it here
    }

    response.to_json


  end

end