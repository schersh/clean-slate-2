class WelcomeController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    if current_user.apartment_id
      redirect_to apartment_path(current_user.apartment)
    elsif current_user.temp_id
      redirect_to user_path(current_user)
    else
      render :index
    end
  end
end
