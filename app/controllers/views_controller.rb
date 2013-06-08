class ViewsController < ApplicationController
  # GET /views
  # GET /views.json
  def index
    @views = View.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @views }
    end
  end

  # GET /views/1
  # GET /views/1.json
  def show
    @view = View.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @view }
    end
  end

  # GET /views/new
  # GET /views/new.json
  def new
    @view = View.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @view }
    end
  end

  # GET /views/1/edit
  def edit
    @view = View.find(params[:id])
  end

  # POST /views
  # POST /views.json
  def create

  	startup_id = params[:startup]
  	sponsor_id = params[:sponsor]

  	view = View.new(:sponsor_id=>sponsor_id, :startup_id=>startup_id)
  	view.save

  	startup_url = view.startup.url

  	redirect_to(startup_url)

  end

  # PUT /views/1
  # PUT /views/1.json
  def update
    @view = View.find(params[:id])

    respond_to do |format|
      if @view.update_attributes(params[:view])
        format.html { redirect_to @view, notice: 'View was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /views/1
  # DELETE /views/1.json
  def destroy
    @view = View.find(params[:id])
    @view.destroy

    respond_to do |format|
      format.html { redirect_to views_url }
      format.json { head :no_content }
    end
  end
end
