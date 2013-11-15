class NewsController < ApplicationController
  def index
    client = initTwitter()

    @trends = client.trends(2459115)
  end

  private

  def initTwitter
    client = Twitter.configure do  |config|
      config.consumer_key        = "5vthI8St0cgtsEBsVViq0Q"
      config.consumer_secret     = "SWwpoF9ploz3HVW07IfhhEViU0VNJthlyTyhPI5Ms"
      #config.access_token        = "240337585-jLmFywQJGGlxdlt8Jvdj4GVhuIzxiCxFUkPGTt3b"
      #config.access_token_secret = "fCRGCYJ1gl7jRcBdxis4gLBwyzgWNTOeIIYlGpJ0JlfvP"
    end
  end
end
