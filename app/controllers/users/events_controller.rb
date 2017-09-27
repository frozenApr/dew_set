module Users
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show edit update destroy]
    def new
      @event = Event.new
      @uptoken = Image.new.uptoken
      @domain = Image.new.domain
    end

    def create
      @event = current_user.events.new(event_params)
      if @event.save
        params[:event][:images][:url].each { |url| @event.images.create(url: url) }
        redirect_to users_events_path
      else
        render 'new'
      end
    end

    def index
      @events = current_user.events.recently
    end

    def destroy
      @event.destroy
      redirect_to users_events_path, notice: '删除成功！'
    end

    def show
      @images = @event.images
      respond_to do |format|
        format.html
        format.json { render json: @images.pluck(:url) }
      end
    end

    private

    def event_params
      params.require(:event).permit(:title, :photo_style, :content, :content_raw,
                                    :city, :model_price, :cameramen_price, :start_time,
                                    :end_time, :deadline, :model_num, :cameramen_num)
    end

    def set_event
      @event = current_user.events.find(params[:id])
    end
  end
end
