class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure do
  	set :views, "app/views"
    set :public_dir, "public"
    #enables sessions as per Sinatra's docs. Session_secret is meant to encript the session id so that users cannot create a fake session_id to hack into your site without logging in. 
    enable :sessions
    set :session_secret, "secret"
  end

  # Renders the home or index page
  get '/' do

  end

  # Renders the sign up/registration page in app/views/registrations/signup.erb
  get '/registrations/signup' do

  end

  # Handles the POST request when user submits the Sign Up form. Get user info from the params hash, creates a new user, signs them in, redirects them. 
  post '/registrations' do
   
  end
  
  # Renders the view page in app/views/sessions/login.erb
  get '/sessions/login' do
   
  end

  # Handles the POST request when user submites the Log In form. Similar to above, but without the new user creation.
  post '/sessions' do

  end

  # Logs the user out by clearing the sessions hash. 
  get '/sessions/logout' do

  end

  # Renders the user's individual home/account page. 
  get '/users/home' do

  end

end
