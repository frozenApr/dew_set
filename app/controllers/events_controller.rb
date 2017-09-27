class EventsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    @events = Event.all.recently
  end

  def show
    @event = event.find(params[:id])
    @comment = Comment.new
  end
end
