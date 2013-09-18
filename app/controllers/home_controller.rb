class HomeController < ApplicationController
  # GET /links
  def index
    #@links = Links.order('created_at DESC').order('position DESC').all
    @links = Links.all(:order => 'position DESC, created_at DESC')


    respond_to do |format|
      format.html # index.html.erb
    end
  end
end



