class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_time)

    if to_boolean(sort_params["ajax"])
      case sort_params["sort_param"]
      when "area"
        @events = @events.group_by { |event| event.area }
      when "language"
        @events = @events.group_by { |event| event.language }
      end
      render "events/_event_list", layout: false
    elsif to_boolean(sort_params["search"])
      area       = sort_params["area"]
      start_time = Date.parse sort_params["start_time"] if start_time.present?
      end_time   = Date.parse sort_params["end_time"] if end_time.present?
      language   = sort_params["language"]

      @events = @events.where(area: area) if area.present?
      @events = @events.where("start_time >= ? AND end_time <= ?", start_time, end_time) if start_time.present? && end_time.present?
      @events = @events.where(language: language) if language.present?

      render "events/_event_list_without_group", layout: false
    end

    @events = @events.group_by { |event| event.start_time.strftime("%B, %Y") }
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :start_time, :end_time, :speaker, :description, :contact, :location, :price, :image)
    end

    def sort_params
      params.permit(:sort_param, :ajax, :area, :language, :start_time, :end_time, :search)
    end
end
