class MakeupsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    @makeups = Makeup.all.recently
  end

  def show
    @makeup = Makeup.find(params[:id])
    @comment = Comment.new
  end
end
