class UsersController < ApplicationController
  before_action :require_login, only: :show

  def show
    @totalTerms = User.totalTerms(current_user)
    @totalDefinitions = User.totalDefinitions(current_user)
  end

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
    username = user_params.delete(:username)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.username = username
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
