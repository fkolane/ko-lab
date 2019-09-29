class PatientsController < ApplicationController


  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @insurances = Insurance.all
  end

  # GET /patients/1/edit
  def edit
    @insurances = Insurance.all
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = current_user.patients.build(patient_params)

    respond_to do |format|
      if @patient.save

        # Create medical record.
        medical_record = MedicalRecord.new 
        medical_record.patient_id = @patient.id
        medical_record.status = "Open"
        medical_record.user_id = @patient.user_id
        medical_record.save
        


        @patients = Patient.all
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
        format.js
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        @patients = Patient.all
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @patient = Patient.find(params[:patient_id])
  end


  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    @patients = Patient.all
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:identifier, :first_name, :last_name, :birth_date, :gender, :ethnic_group, :born_place, :city, :neighbourhood, :address, :phone, :father_first_name, 
        :mother_first_name, :mother_last_name, :insured, :dependent, :dependent_person_name, :insurance_id, :insurance_identifier, :insurance_start_date, :insurance_end_date  )
    end
end
