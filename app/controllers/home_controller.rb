class HomeController < ApplicationController
  # GET /links
  def index
    @links = Links.order('position DESC').all


    respond_to do |format|
      format.html # index.html.erb
    end
  end
end



