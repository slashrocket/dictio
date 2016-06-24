class UsersController < ApplicationController
    
    def create
        @user = user_from_params
        if @user.save
            sign_in @user
            redirect_to root_path
        else
            render template: 'users/new'
        end
    end
    
    private
    
    def user_from_params
        user_params = params[:user] || Hash.new
        first_name = user_params.delete(:first_name)
        last_initial = user_params.delete(:last_initial)
        email = user_params.delete(:email)
        password = user_params.delete(:password)
    
    Clearance.configuration.user_model.new(user_params).tap do |user|
        user.first_name = first_name
        user.last_initial = last_initial
        user.email = email
        user.password = password
    end
    end
end


