class PrestationTypesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_prestation_type, only: [:show, :edit, :update, :destroy]

  # GET /prestation_types
  # GET /prestation_types.json
  def index
    @prestation_types = PrestationType.all
  end

  # GET /prestation_types/1
  # GET /prestation_types/1.json
  def show
  end

  # GET /prestation_types/new
  def new
    @prestation_type = PrestationType.new
  end

  # GET /prestation_types/1/edit
  def edit
  end

  # POST /prestation_types
  # POST /prestation_types.json
  def create
    @prestation_type = current_user.prestation_types.build(prestation_type_params)

    respond_to do |format|
      if @prestation_type.save
        @prestation_types = PrestationType.all

        format.html { redirect_to @prestation_type, notice: 'Prestation type was successfully created.' }
        format.json { render :show, status: :created, location: @prestation_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @prestation_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /prestation_types/1
  # PATCH/PUT /prestation_types/1.json
  def update
    respond_to do |format|
      if @prestation_type.update(prestation_type_params)
        @prestation_types = PrestationType.all

        format.html { redirect_to @prestation_type, notice: 'Prestation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @prestation_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @prestation_type = PrestationType.find(params[:prestation_type_id])
  end

  # DELETE /prestation_types/1
  # DELETE /prestation_types/1.json
  def destroy
    @prestation_type.destroy
    @prestation_types = PrestationType.all

    respond_to do |format|
      format.html { redirect_to prestation_types_url, notice: 'Prestation type was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation_type
      @prestation_type = PrestationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_type_params
      params.require(:prestation_type).permit(:name, :description)
    end
end
