class UsersController < ApplicationController

    
    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect to "/tweets"
        end
        erb :"/users/create_user"
    end

    post '/signup' do
        # binding.pry
        if !(params.has_value?(""))
            user = User.create(params)
            session["user_id"] = user.id 
            redirect to "/tweets"
        else
            redirect to "/signup"
        end
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to "/tweets"
        end
        erb :"/users/login"
    end

end
