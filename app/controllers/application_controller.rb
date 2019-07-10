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
      erb :home
  end

  get '/home' do
    erb :'/home'
  end

  get 'my_post' do
    erb :my_post
  end

  get 'upload' do
    erb :upload
  end

  # # Renders the sign up/registration page in app/views/registrations/signup.erb
  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  # # Handles the POST request when user submits the Sign Up form. Get user info from the params hash, creates a new user, signs them in, redirects them. 
  post '/registrations' do
      user = User.create(email: params["email"])
      user.password = params["password"]
      user.save
      session[:user_id] = user.id
      redirect '/posts/forsale'
  end
  
  # Renders the view page in app/views/sessions/login.erb
  get '/sessions/login' do
    erb :'sessions/login'
  end

  # Handles the POST request when user submites the Log In form. Similar to above, but without the new user creation.
  post '/sessions' do
    user = User.find_by(email: params["email"])
    if user.password == params["password"]
      session[:user_id] = user.id
      redirect '/'
    else
      redirect 'sessions/login'
    end
  end

  # Logs the user out by clearing the sessions hash. 
  get '/sessions/logout' do
      session.clear 
      redirect '/'
  end

  # Renders the user's individual home/account page. 
  # get '/users/home' do
  #     @user =User.find(session[:user_id])
  #     erb :'/'
  # end

  get "/posts/forsale" do
    erb :'/posts/forsale'
  end

  #######################################posting
  # get "/posts/jobs" do
  #   erb :'/posts/jobs'
  # end
  get '/posts/my_post' do
    erb :'/posts/my_post'
  end

   ####################################### posts uploading

  get "/posts/upload" do
    # user =User.find(session[:user_id])
    erb :'/posts/upload'
  end

  post "/posts/upload" do
    user = Post.create(name: params["name"], image_url: params["image_url"])
    session[:user_id] = user.id
    redirect '/posts/my_post'
    if user.nil?
      redirect 'sessions/login'
    end
  end
  
end
