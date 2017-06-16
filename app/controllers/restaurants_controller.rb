class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  before_action :check_if_logged_in, only: [:create, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params['id'])
    @elements = @restaurant.floorplans
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.operator_id = @current_operator.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :image, :operator_id)
    end

    def check_if_logged_out
      if(@current_operator)
        flash[:error] = "You are already logged in."
        redirect_to(operator_path(session[:operator_id]))
      end
    end

    def check_if_logged_in
      if(!@current_operator)
        flash[:error] = "You need to be logged in."
        redirect_to("/login")
      end
    end

    def check_if_same_operator
      if(@current_operator.id != params["id"].to_i)
        flash[:error] = "You cannot visit that page."
        redirect_to(operator_path(@current_operator))
      end
    end

    def authorise
      unless @current_operator
        flash[:error] = "You need to be logged in for that"
        redirect_to "/login"
      end
    end
end
