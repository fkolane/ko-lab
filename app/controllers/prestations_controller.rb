class PrestationsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_prestation, only: [:show, :edit, :update, :destroy]

  # GET /prestations
  # GET /prestations.json
  def index
    @prestations = Prestation.all
  end

  # GET /prestations/1
  # GET /prestations/1.json
  def show
  end

  # GET /prestations/new
  def new
    @prestation = Prestation.new
    @prestation_types = PrestationType.all
  end

  # GET /prestations/1/edit
  def edit
    @prestation_types = PrestationType.all

  end

  # POST /prestations
  # POST /prestations.json
  def create
    @prestation = current_user.prestations.build(prestation_params)

    respond_to do |format|
      if @prestation.save
        @prestations = Prestation.all
        format.html { redirect_to @prestation, notice: 'Prestation was successfully created.' }
        format.json { render :show, status: :created, location: @prestation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /prestations/1
  # PATCH/PUT /prestations/1.json
  def update
    respond_to do |format|
      if @prestation.update(prestation_params)
        @prestations = Prestation.all
        format.html { redirect_to @prestation, notice: 'Prestation was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @prestation = Prestation.find(params[:prestation_id])
  end

  # DELETE /prestations/1
  # DELETE /prestations/1.json
  def destroy
    @prestation.destroy
    respond_to do |format|
      format.html { redirect_to prestations_url, notice: 'Prestation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation
      @prestation = Prestation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_params
      params.require(:prestation).permit(:prestation_type_id, :name, :price)
    end
end
