require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end  

  get '/' do
    erb :index
  end
  
  get '/signup' do 
    erb :'/users/signup'
  end

<<<<<<< HEAD
  # post '/signup' do 
  #   @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
  #   if @user.save 
  #     session[:username] = @user.username
  #     redirect_to '/tweets'
  #   # else
  #   #   erb :'/users/signup'
  #   end
  # end
  
  post '/signup' do
      
      if !(params.has_value?(""))
          user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        binding.pry
          session["user_id"] = user.id 
          redirect to "/tweets"
      else
          redirect to "/signup"
      end
=======
  post '/signup' do 
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    binding.pry
    if @user.save 
      session[:username] = @user.username
      redirect_to '/tweets'
    # else
    #   erb :'/users/signup'
    end
>>>>>>> 3cd3328f4f0937ce85fdfe4f3451e1f08d044a78
  end

  helpers do
    def current_user
      @user ||= User.find_by_id(session[:user_id])
      
    end
  
    def is_logged_in?
      !!current_user
    end
  end
end