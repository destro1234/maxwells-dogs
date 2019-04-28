require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :home
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
    DogWalker.find(session[:id]) if session[:id]
  end
  end

end
