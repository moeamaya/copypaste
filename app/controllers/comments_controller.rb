class CommentsController < ApplicationController
  def create
    @links = Links.find(params[:links_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to links_path(@links)
  end
end
