class UsersController < ApplicationController

     # get '/user/home' do 
     #      if is_logged_in?
     #           erb :"/users/home"
     #      else
     #           redirect "/login"
     #      end
     # end

     get "/signup" do
          if !is_logged_in?
               erb :"/users/signup"
          else
               redirect to "/tweets"
          end
     end

     post "/signup" do 
          @user = User.new(params[:username], params[:email], params[:password])

          if @user.save
               session[:user_id] = @user.id
               redirect to '/tweets'
          else
               erb :"/users/signup"
          end
     end

     get '/login' do 
          erb :"/users/login"
     end

     post '/login' do 
          @user = User.find_by(username: params[:username])
          if @user && @user.authenticate(params[:password])
               session[:user_id] = @user.id
               redirect '/tweets'
          else
               erb :"/users/login"
          end
     end

     get '/logout' do 
          session.clear
          redirect '/login'
     end

end
