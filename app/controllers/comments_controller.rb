class CommentsController < ApplicationController

  def create
    @links = Links.find(params[:link_id])
    @comment = @links.comments.create(comments_params)

    @links.update_attribute(:position, @comment.created_at )
    redirect_to "/"
  end

  def show
    @links = Links.find(params[:link_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @links = Links.find(params[:link_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
    end
  end


  def update
    @comment = Comment.find(params[:id])


    respond_to do |format|
      if @comment.update_attributes(comments_params)
        format.html { redirect_to('/', :notice => 'Link was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @link = Links.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end

end

