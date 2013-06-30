class SearchController < ApplicationController
  
  # GET /links
  def index
    @search = params[:link]
    
    page = Nokogiri::HTML(open(@search))   
    #page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
   
    @web_result = page.css('title').text
    #@web_result = page.css('.size-large')[1]['src']
   
    respond_to do |format|
      format.js { render :json => @web_result}
    end
  end
  
end