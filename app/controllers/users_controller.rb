class UsersController < ApplicationController

    
    get '/signup' do
        if is_logged_in?
            redirect to "/tweets"
        end
        erb :"/users/create_user"
    end

<<<<<<< HEAD
=======
    post '/signup' do
        # binding.pry
        
        if !(params.has_value?(""))
            user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
            session["user_id"] = user.id 
            redirect to "/tweets"
        else
            redirect to "/signup"
        end
    end

>>>>>>> 3cd3328f4f0937ce85fdfe4f3451e1f08d044a78
    get '/login' do
        if is_logged_in?
            redirect to "/tweets"
        end
        erb :"/users/login"
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session["user_id"] = user.id 
            redirect to "/tweets"
        else
            redirect to "/login"
        end
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        if !@user.nil?
            erb :"/users/user_tweets"
        else
            redirect to "/login"
        end
    end

    get '/logout' do
        if is_logged_in?
            session.clear
        else
            redirect to "/"
        end
        redirect to "/login"
    end
end