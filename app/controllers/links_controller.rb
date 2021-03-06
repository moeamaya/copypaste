class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    @links_show = Links.order('position DESC').all
    @links = Links.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @links = Links.new

    redirect_to '/'
  end

  # GET /links/new
  # GET /links/new.xml
  def new
    @links = Links.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /links/1/edit
  def edit
    @links = Links.find(params[:id])
  end

  # POST /links
  def create
    @links = Links.new(link_params)
    @links.position = @links.created_at

    respond_to do |format|
      if @links.save
        @links.update_attribute(:position, @links.created_at )
        format.html { redirect_to('/', :notice => 'Link was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /links/1
  def update
    @link = Links.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(link_params)
        format.html { redirect_to(@link, :notice => 'Link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = Links.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to('/') }
    end
  end

  private

  def link_params
    params.require(:links).permit(:address, :name, :title, :description, :thumbnail)
  end




end
