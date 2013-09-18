class HomeController < ApplicationController
  # GET /links
  def index
    #@links = Links.order('created_at DESC').order('position DESC').all
    @data = Links.all
    @games = @data.sort_by {|x| [x.position, x.created_at] }


    respond_to do |format|
      format.html # index.html.erb
    end
  end
end



