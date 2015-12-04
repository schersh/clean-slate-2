class ApartmentsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    if current_user.update(apartment: @apartment)
      redirect_to apartment_path (@apartment)
    end
  end

  def show

  end

  def edit

  end

  def update
    if @apartment.update(apartment_params)
      flash[:notice] = "You have successfully update this apartment."
    end
    redirect_to apartment_path(@apartment)
  end

  def destroy
    @apartment.destroy
    redirect_to apartment_path
  end

  def clean_slate
    @apartment = current_user.apartment
    @apartment.clean_slate
    redirect_to apartment_path(@apartment)
  end

  private
    def apartment_params
      params.require(:apartment).permit(:name)
    end

    def set_post
      @apartment = Apartment.find(params[:id])
  end

end
