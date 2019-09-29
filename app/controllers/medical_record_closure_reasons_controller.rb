class MedicalRecordClosureReasonsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_medical_record_closure_reason, only: [:show, :edit, :update, :destroy]

  # GET /medical_record_closure_reasons
  # GET /medical_record_closure_reasons.json
  def index
    @medical_record_closure_reasons = MedicalRecordClosureReason.all
  end

  # GET /medical_record_closure_reasons/1
  # GET /medical_record_closure_reasons/1.json
  def show
  end

  # GET /medical_record_closure_reasons/new
  def new
    @medical_record_closure_reason = MedicalRecordClosureReason.new
  end

  # GET /medical_record_closure_reasons/1/edit
  def edit
  end

  # POST /medical_record_closure_reasons
  # POST /medical_record_closure_reasons.json
  def create
    @medical_record_closure_reason = current_user.medical_record_closure_reasons.build(medical_record_closure_reason_params)

    respond_to do |format|
      if @medical_record_closure_reason.save
        format.html { redirect_to @medical_record_closure_reason, notice: 'Medical record closure reason was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record_closure_reason }
        format.js
      else
        format.html { render :new }
        format.json { render json: @medical_record_closure_reason.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medical_record_closure_reasons/1
  # PATCH/PUT /medical_record_closure_reasons/1.json
  def update
    respond_to do |format|
      if @medical_record_closure_reason.update(medical_record_closure_reason_params)
        @medical_record_closure_reasons = MedicalRecordClosureReason.all

        format.html { redirect_to @medical_record_closure_reason, notice: 'Medical record closure reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record_closure_reason }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @medical_record_closure_reason.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @medical_record_closure_reason = MedicalRecordClosureReason.find(params[:medical_record_closure_reason_id])
  end


  # DELETE /medical_record_closure_reasons/1
  # DELETE /medical_record_closure_reasons/1.json
  def destroy
    @medical_record_closure_reason.destroy
    @medical_record_closure_reasons = MedicalRecordClosureReason.all

    respond_to do |format|
      format.html { redirect_to medical_record_closure_reasons_url, notice: 'Medical record closure reason was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record_closure_reason
      @medical_record_closure_reason = MedicalRecordClosureReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_closure_reason_params
      params.require(:medical_record_closure_reason).permit(:name, :description)
    end
end
