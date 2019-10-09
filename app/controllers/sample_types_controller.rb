class SampleTypesController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"



  before_action :set_sample_type, only: [:show, :edit, :update, :destroy]

  # GET /sample_types
  # GET /sample_types.json
  def index
    @sample_types = SampleType.all
  end

  # GET /sample_types/1
  # GET /sample_types/1.json
  def show
  end

  # GET /sample_types/new
  def new
    @sample_type = SampleType.new
  end

  # GET /sample_types/1/edit
  def edit
  end

  # POST /sample_types
  # POST /sample_types.json
  def create
    @sample_type = SampleType.new(sample_type_params)

    respond_to do |format|
      if @sample_type.save
        format.html { redirect_to @sample_type, notice: 'Sample type was successfully created.' }
        format.json { render :show, status: :created, location: @sample_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sample_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /sample_types/1
  # PATCH/PUT /sample_types/1.json
  def update
    respond_to do |format|
      if @sample_type.update(sample_type_params)
        format.html { redirect_to @sample_type, notice: 'Sample type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample_type }
      else
        format.html { render :edit }
        format.json { render json: @sample_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @sample_type = SampleType.find(params[:sample_type_id])
  end


  # DELETE /sample_types/1
  # DELETE /sample_types/1.json
  def destroy
    @sample_type.destroy
    respond_to do |format|
      format.html { redirect_to sample_types_url, notice: 'Sample type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_type
      @sample_type = SampleType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_type_params
      params.require(:sample_type).permit(:name, :description)
    end
end
