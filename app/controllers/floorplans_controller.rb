class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :edit, :destroy]

  def index
    @floorplans = Floorplan.all
  end

  def add
    floorplan = Floorplan.new
    floorplan.width = params[:width]
    floorplan.height = params[:height]
    floorplan.top = params[:top]
    floorplan.left = params[:left]
    floorplan.background = params[:background]
    floorplan.restaurant_id = params[:id]
    floorplan.save

    render json: { floorplan: floorplan }
  end

  def show
  end

  def new
    @restaurant = Restaurant.find_by id: params[:id]
    @floorplan = Floorplan.new
  end

  def edit
  end

  def update

    floorplan = Floorplan.find_by id: params[:floorplanId]
    floorplan.width = params[:width]
    floorplan.height = params[:height]
    floorplan.top = params[:top]
    floorplan.left = params[:left]
    floorplan.background = params[:background]
    floorplan.restaurant_id = params[:id]
    floorplan.save

    render json: { floorplan: floorplan }
  end

  def create
    @floorplan = Floorplan.new(floorplan_params)

    respond_to do |format|
      if @floorplan.save
        format.html { redirect_to @floorplan, notice: 'Floorplan was successfully created.' }
        format.json { render :show, status: :created, location: @floorplan }
      else
        format.html { render :new }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @floorplan.destroy
    respond_to do |format|
      format.html { redirect_to floorplans_url, notice: 'Floorplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_floorplan
      @floorplan = Floorplan.find(params[:id])
    end

    def floorplan_params
      params.require(:floorplan).permit(:top, :left, :restaurant_id)
    end

end
