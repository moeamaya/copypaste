class HomeController < ApplicationController
  # GET /links
  def index
    #@links = Links.order('created_at DESC').order('position DESC').all
    @position = Links.where("position is not null").order("position DESC")
    @empty_position = Links.where("position is null").order("created_at DESC")
    @links_show = @position + @empty_position
    @links = Links.new


    respond_to do |format|
      format.html # index.html.erb
    end
  end
end



