require 'nokogiri'
require 'open-uri'
require 'embedly'
require 'json'

class SearchController < ApplicationController

  # GET /links
  def oldsearch
    @search = params[:link]

    page = Nokogiri::HTML(open(@search))
    #page = Nokogiri::HTML(open("http://en.wikipedia.org/"))

    @web_result = page.css('title').text
    #@web_result = page.css('.size-large')[1]['src']

    respond_to do |format|
      format.html { render :text => @web_result}
    end
  end

  def index
    # call api with key (you'll need a real key)
    embedly_api = Embedly::API.new :key => '02431a73f9cd4dc1b0db0069d31c2bba',
    :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    url = params[:links]
    obj = embedly_api.extract :url => url
    puts JSON.pretty_generate(obj[0].marshal_dump)
    @web_result = obj[0]
    respond_to do |format|
      format.json { render :json => @web_result }
    end
  end

end