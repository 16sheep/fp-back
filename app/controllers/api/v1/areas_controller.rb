class Api::V1::AreasController < ApplicationController


  # GET /areas
  def index
    @areas = Area.all
    render json: @areas
  end

  def festival_areas
    festival = Festival.find(params["id"])
    render json: festival.areas
  end

  # GET /areas/1
  def show
    render json: @area
  end

  # POST /areas
  def create
    area = Area.create(name:params["name"], description: params["description"], icon: params["icon"], festival_id: params["festival_id"])
    festival = Festival.find(params["festival_id"])
    render json: festival.areas
  end

  # PATCH/PUT /areas/1
  def update
    area = Area.find(params["area_id"])
    print area
    area.update(name:params["name"], description: params["description"], icon: params["icon"], x: params["coordinates"]["x"], y: params["coordinates"]["y"])
    print params["coordinates"]
    if params["coorinates"] == true
      print "WWWEEEEGOOOOOTTTTCOOOOOOOOOOOOOOOORRRDDSS"
      area.update(x:params["coordinates"]["x"], y: ["coordinates"]["x"])
    end
    festival = Festival.find(params["festival_id"])
    render json: festival.areas
  end

  # DELETE /areas/1
  def destroy
    area = Area.find(params["area_id"])

    area.destroy
    festival = Festival.find(params["festival_id"])
    render json: festival.areas
  end

  private
    # Use callbacks to share common setup or constraints between actions.

end
