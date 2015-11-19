class ApartmentsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    @user = current_user
    if current_user
      @apartment = current_user.apartment
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    unless @apartment.save
      redirect_to new_apartment_path
    end
    @apt_id = @apartment.id
    current_user.apartment_id = @apt_id
    if current_user.save
      redirect_to apartment_path (@apartment)
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
    @roommates = @apartment.users
    user = current_user
    @roommate_sums = []
    unless @apartment.expenses.empty?
      @expenses = current_user.expenses
      @roommate_sums = roommate_sums
      @grand_total = get_total
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])
    @roommates = @apartment.users
  end

# fixed tpyo - "update" to "updated"
  def update
    @user = current_user
    @apartment.update(apartment_params)
    if @apartment.update(apartment_params)
      flash[:notice] = "You have successfully update this apartment."
    end
    redirect_to apartment_path(@apartment)
  end

  def destroy
    @apartment.destroy
    redirect_to apartment_path
  end

  def get_total
    @apartment = Apartment.find(params[:id])
    unless @apartment.expenses.empty?
      @apartment.expenses.map {|expense| expense.amount}.reduce(:+)
    end
  end
  
# this also seems like something you could include in apartment model as a method
  def roommate_sums
    @apartment = Apartment.find(params[:id])
    unless @apartment.expenses.empty?
      users = @apartment.users
      apartment_total = get_total
      apartment_average = (apartment_total / users.length)
      roommate_sums = []
      users.each do |user|
        total = user.expenses.map {|expense| expense.amount}.reduce(:+)
        balance = apartment_average - total
        roommate_sums << {:total => total, :balance => balance, :user => user}
      end
    end
    return roommate_sums
  end



  private
    def apartment_params
      params.require(:apartment).permit(:name)
    end

    def set_post
      @apartment = Apartment.find(params[:id])
  end

end
