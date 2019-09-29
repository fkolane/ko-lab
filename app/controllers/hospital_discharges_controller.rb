class HospitalDischargesController < ApplicationController
  before_action :set_hospital_discharge, only: [:show, :edit, :update, :destroy]

  # GET /hospital_discharges
  # GET /hospital_discharges.json
  def index
    @hospital_discharges = HospitalDischarge.all
  end

  # GET /hospital_discharges/1
  # GET /hospital_discharges/1.json
  def show
  end

  # GET /hospital_discharges/new
  def new
    @hospital_discharge = HospitalDischarge.new
  end

  # GET /hospital_discharges/1/edit
  def edit
  end

  # POST /hospital_discharges
  # POST /hospital_discharges.json
  def create
    @hospital_discharge = HospitalDischarge.new(hospital_discharge_params)

    respond_to do |format|
      if @hospital_discharge.save
        format.html { redirect_to @hospital_discharge, notice: 'Hospital discharge was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_discharge }
      else
        format.html { render :new }
        format.json { render json: @hospital_discharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_discharges/1
  # PATCH/PUT /hospital_discharges/1.json
  def update
    respond_to do |format|
      if @hospital_discharge.update(hospital_discharge_params)
        format.html { redirect_to @hospital_discharge, notice: 'Hospital discharge was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_discharge }
      else
        format.html { render :edit }
        format.json { render json: @hospital_discharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_discharges/1
  # DELETE /hospital_discharges/1.json
  def destroy
    @hospital_discharge.destroy
    respond_to do |format|
      format.html { redirect_to hospital_discharges_url, notice: 'Hospital discharge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_discharge
      @hospital_discharge = HospitalDischarge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_discharge_params
      params.require(:hospital_discharge).permit(:hospital_discharge_mode, :patient_id, :medical_record_id, :service_id, :doctor_id, :destination_hospital, :destination_service, :reason, :destination_doctor, :destination_doctor_phone, :notes, :status, :user_id)
    end
end
