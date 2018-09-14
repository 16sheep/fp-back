class Api::V1::FestivalsController < ApplicationController
  before_action :set_festival, only: [:show, :update, :destroy]

  # GET /festivals
  def index
    festivals = Festival.all
    render json: festivals
  end

  # GET /festivals/1
  def show
    render json: @festival
  end

  # POST /festivals
  def create
    user = User.find(params["current_user"]["id"])
    festival = params[:festival]
    festival = Festival.create(festival_params)
    assignment = Assignment.create(user_id: user["id"], festival_id: festival.id, role_id: 1)
    render json: user.managed_festivals
  end

  # PATCH/PUT /festivals/1
  def update
    user = User.find(params["current_user"]["id"])
    if @festival.update(festival_params)
      render json: user.managed_festivals
    else
      render json: @festival.errors, status: :unprocessable_entity
    end
  end

  # DELETE /festivals/1
  def destroy
    user = User.find(params["current_user"]["id"])
    festival = Festival.find(params[:id])
    festival.destroy
    render json: user.managed_festivals
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def festival_params
      params.require(:festival).permit(:name, :location, :logo_img, :map_img, :date_from, :date_until, :user_id, :secret)
    end
end
