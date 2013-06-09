class StartupsController < ApplicationController
  # GET /startups
  # GET /startups.json
  def index
    @startups = Startup.all

    @current_user = session[:startup_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @startups }
    end
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    @startup = Startup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @startup }
    end
  end

  # GET /startups/new
  # GET /startups/new.json
  def new
    @startup = Startup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @startup }
    end
  end

  # GET /startups/1/edit
  def edit
    @startup = Startup.find(params[:id])
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = Startup.new(params[:startup])

    respond_to do |format|
      if @startup.save
      	user = User.find_by_facebook_id(session[:facebook_id])
      	user.startup_id = @startup.id
      	user.save
      	set_logged_in_user(@startup.id)
        format.html { redirect_to @startup, notice: 'Startup was successfully created.' }
        format.json { render json: @startup, status: :created, location: @startup }
      else
        format.html { render action: "new" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /startups/1
  # PUT /startups/1.json
  def update
    @startup = Startup.find(params[:id])

    respond_to do |format|
      if @startup.update_attributes(params[:startup])
        format.html { redirect_to @startup, notice: 'Startup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy

    respond_to do |format|
      format.html { redirect_to startups_url }
      format.json { head :no_content }
    end
  end

  def dup_hash(ary)
  ary.inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select {
    |k,v| v > 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
end

  # no retorna nada, si no hay un sponsor con más de 50 views
  # de lo contrario, retorna el banner publicitario
  def show_ad
  	startup_id = params[:startup]

		# TODO agregarle lógica
		startup = Startup.find(startup_id)
		views = startup.views
		frecuencias = {}
		sponsor_id = 0

		views.each do |view|

			sponsor_id = view.sponsor_id
			if frecuencias[sponsor_id] == nil
				frecuencias[sponsor_id] = 1
			else
				frecuencias[sponsor_id] += 1
			end

		end

		maximaFrecuencia = 0
		maximoSponsor = -1

		frecuencias.each_pair do |temp_sponsor_id, frecuencia|

			if frecuencia > maximaFrecuencia
				maximaFrecuencia = frecuencia
				maximoSponsor = temp_sponsor_id
			end

		end

		if maximoSponsor == -1
			render ""
		else

			sponsor = Startup.find(maximoSponsor)
			render :text => "<img src='" << sponsor.ad.url << "' width='200px' height='50px' />"

		end
  end



end
