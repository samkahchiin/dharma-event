class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.approved.order(:start_time)
    ajax    = to_boolean(sort_params["ajax"])
    search  = to_boolean(sort_params["search"])

    if ajax
      case sort_params["sort_param"]
      when "area"
        @events = @events.group_by { |event| event.area }
      when "language"
        @events = @events.group_by { |event| event.language }
      else
        @events = @events.group_by { |event| event.start_time.strftime("%B, %Y") }
      end

      render("events/event_list/_grouped_event_list", layout: false) and return
    elsif search
      area       = sort_params["area"]
      start_time = Date.parse sort_params["start_time"] if sort_params["start_time"].present?
      end_time   = Date.parse sort_params["end_time"] if sort_params["end_time"].present?
      language   = sort_params["language"]

      @events = @events.where(area: area) if area.present?
      @events = @events.where("start_time >= ? AND end_time <= ?", start_time, end_time) if start_time.present? && end_time.present?
      @events = @events.where(language: language) if language.present?

      render("events/event_list/_event_list", layout: false) and return
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
    modified_params = convert_datetime_params event_params
    @event = Event.new(modified_params)
    @event.user = current_user

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
    modified_params = convert_datetime_params event_params
    respond_to do |format|
      if @event.update(modified_params)
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

    def require_permission
      redirect_to root_path, alert: "You are not allowed to do this action!" if current_user != Event.find(params[:id]).user
    end

    def event_params
      params.require(:event).permit(
        :title,
        :start_time,
        :end_time,
        :speaker,
        :description,
        :contact,
        :location,
        :image,
        :language,
        :organizer_name,
        :area,
        :register_form,
        :register_link,
        prices_attributes: [:id, :price_type, :amount, :_destroy]
      )
    end

    def convert_datetime_params event_params
      event_params[:start_time] = DateTime.strptime event_params[:start_time], "%m/%d/%Y %I:%M %p"
      event_params[:end_time] = DateTime.strptime event_params[:end_time], "%m/%d/%Y %I:%M %p"
      event_params
    end

    def sort_params
      params.permit(
        :sort_param,
        :ajax,
        :start_time,
        :end_time,
        :search,
        area: [],
        language: []
      )
    end
end
