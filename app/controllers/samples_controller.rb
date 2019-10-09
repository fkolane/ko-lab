class SamplesController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_sample, only: [:show, :edit, :update, :destroy]

  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.all
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
  end

  # GET /samples/new
  def new

    
    @patients = Patient.all
    @sample_types = SampleType.all

    



    @sample = Sample.new
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample = current_user.samples.build(sample_params)

    respond_to do |format|
      if @sample.save
        @samples = Sample.all

        format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
        format.json { render :show, status: :created, location: @sample }
        format.js

      else
        format.html { render :new }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /samples/1
  # PATCH/PUT /samples/1.json
  def update
    respond_to do |format|
      if @sample.update(sample_params)
        @samples = Sample.all

        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end
  def delete
    @sample = Sample.find(params[:sample_id])
  end


  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample.destroy
    @samples = Sample.all

    respond_to do |format|
      format.html { redirect_to samples_url, notice: 'Sample was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.require(:sample).permit(:doctor_id, :sample_type_id, :patient_id)
    end
end
