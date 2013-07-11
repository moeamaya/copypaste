class CommentsController < ApplicationController
  
  def create
    @links = Links.find(params[:link_id])
    @comment = @links.comments.create(params[:comment])
    redirect_to "/"
  end

 def destroy
    @link = Links.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end

end
