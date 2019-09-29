class InsurancePrestationsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_insurance_prestation, only: [:show, :edit, :update, :destroy]

  # GET /insurance_prestations
  # GET /insurance_prestations.json
  def index
    @insurance_prestations = InsurancePrestation.all
  end

  # GET /insurance_prestations/1
  # GET /insurance_prestations/1.json
  def show
  end

  # GET /insurance_prestations/new
  def new
    @insurance_prestation = InsurancePrestation.new
    @prestations = Prestation.all
    @insurances = Insurance.all
  end

  # GET /insurance_prestations/1/edit
  def edit
    @prestations = Prestation.all
    @insurances = Insurance.all
  end

  # POST /insurance_prestations
  # POST /insurance_prestations.json
  def create
    @insurance_prestation = current_user.insurance_prestations.build(insurance_prestation_params)

    respond_to do |format|
      if @insurance_prestation.save
        @insurance_prestations = InsurancePrestation.all


        format.html { redirect_to @insurance_prestation, notice: 'Insurance prestation was successfully created.' }
        format.json { render :show, status: :created, location: @insurance_prestation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @insurance_prestation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /insurance_prestations/1
  # PATCH/PUT /insurance_prestations/1.json
  def update
    respond_to do |format|
      if @insurance_prestation.update(insurance_prestation_params)
        @insurance_prestations = InsurancePrestation.all

        format.html { redirect_to @insurance_prestation, notice: 'Insurance prestation was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_prestation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @insurance_prestation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @insurance_prestation = InsurancePrestation.find(params[:insurance_prestation_id])
  end

  # DELETE /insurance_prestations/1
  # DELETE /insurance_prestations/1.json
  def destroy
    @insurance_prestation.destroy
    @insurance_prestations = InsurancePrestation.all

    respond_to do |format|
      format.html { redirect_to insurance_prestations_url, notice: 'Insurance prestation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_prestation
      @insurance_prestation = InsurancePrestation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_prestation_params
      params.require(:insurance_prestation).permit(:insurance_id, :prestation_id, :percentage)
    end
end
