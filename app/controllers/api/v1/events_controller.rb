class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end
  # GET EVENTS FOR ONE FESTIVAL
  def festival_events
    festival = Festival.find(params["id"])
    render json: festival.events
  end

  def festival_categories
    festival = Festival.find(params["id"])
    events = festival.events
    categories = {}
    events.each do |e|
      if !categories.key?(e.category)
        print e.category
        category_events = Event.find_by(category: e.category)
        print category_events
        categories["#{e.category}"] = category_events
      end
    end
    render json: categories
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    time_from = DateTime.parse("#{params["date_from"]} #{params["time_from"]} #{params["time_zone"]}")
    time_until = DateTime.parse("#{params["date_until"]} #{params["time_until"]} #{params["time_zone"]}")
    print(time_from)
    print(time_until)
    event = Event.create(name:params["name"], description: params["description"], category: params["category"], time_from: time_from, time_until:time_until, area_id: params["area_id"], user_id: params["event_manager"], festival_id: params["festival_id"])
    festival = Festival.find(params["festival_id"])
    render json: festival.events
  end

  # PATCH/PUT /events/1
  def update
    time_from = DateTime.parse("#{params["date_from"]} #{params["time_from"]} #{params["time_zone"]}")
    time_until = DateTime.parse("#{params["date_until"]} #{params["time_until"]} #{params["time_zone"]}")
    event = Event.find(params["event_id"])
    event.update(name:params["name"], description: params["description"], category: params["category"], time_from: time_from, time_until:time_until, area_id: params["area_id"], user_id: params["event_manager"])
    festival = Festival.find(params["festival_id"])
    render json: festival.events
  end

  # DELETE /events/1
  def destroy
    event = Event.find(params["event_id"])
    event.destroy
    festival = Festival.find(params["festival_id"])
    render json: festival.events
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :area_id, :festival_id, :user_id, :time_from, :time_until, :category, :current_user, :event_manager)
    end
end
