class RestaurantsController < ApplicationController
before_action :set_review, only: [:destroy]
   def index
    @restaurants = Restaurant.all
  end

   def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @reviews = Review.find(@restaurant.id)
    @reviews.each do |review|
    review.destroy
    end
    @restaurant.destroy



    # @restaurant = Restaurant.find(params[:id])
    # @reviews = @restaurant.reviews
    # @reviews.destroy
    # @restaurant.destroy
    # # no need for app/views/restaurants/destroy.html.erb
    # redirect_to restaurants_path
  end

   private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
