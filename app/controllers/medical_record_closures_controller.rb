class MedicalRecordClosuresController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_medical_record_closure, only: [:show, :edit, :update, :destroy]

  # GET /medical_record_closures
  # GET /medical_record_closures.json
  def index
    @medical_record_closures = MedicalRecordClosure.all
  end

  # GET /medical_record_closures/1
  # GET /medical_record_closures/1.json
  def show
  end

  # GET /medical_record_closures/new
  def new
    @patients = Patient.all
    @medical_record_closure_reasons = MedicalRecordClosureReason.all
    @medical_record_closure = MedicalRecordClosure.new
  end

  # GET /medical_record_closures/1/edit
  def edit
  end

  # POST /medical_record_closures
  # POST /medical_record_closures.json
  def create
    @medical_record_closure = current_user.medical_record_closures.build(medical_record_closure_params)

    respond_to do |format|
      if @medical_record_closure.save
        @medical_record_closures = MedicalRecordClosure.all

        format.html { redirect_to @medical_record_closure, notice: 'Medical record closure was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record_closure }
        format.js
      else
        format.html { render :new }
        format.json { render json: @medical_record_closure.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medical_record_closures/1
  # PATCH/PUT /medical_record_closures/1.json
  def update
    respond_to do |format|
      if @medical_record_closure.update(medical_record_closure_params)
        @medical_record_closures = MedicalRecordClosure.all

        format.html { redirect_to @medical_record_closure, notice: 'Medical record closure was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record_closure }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @medical_record_closure.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @medical_record_closure = MedicalRecordClosure.find(params[:medical_record_closure_id])
  end

  # DELETE /medical_record_closures/1
  # DELETE /medical_record_closures/1.json
  def destroy
    @medical_record_closure.destroy
    @medical_record_closures = MedicalRecordClosure.all

    respond_to do |format|
      format.html { redirect_to medical_record_closures_url, notice: 'Medical record closure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record_closure
      @medical_record_closure = MedicalRecordClosure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_closure_params
      params.require(:medical_record_closure).permit(:medical_record_closure_reason_id, :patient_id)
    end
end
