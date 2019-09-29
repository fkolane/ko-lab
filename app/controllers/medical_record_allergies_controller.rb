class MedicalRecordAllergiesController < ApplicationController
  before_action :set_medical_record_allergy, only: [:show, :edit, :update, :destroy]
  

  # GET /medical_record_allergies
  # GET /medical_record_allergies.json
  def index
    @medical_record_allergies = MedicalRecordAllergy.all
  end

  # GET /medical_record_allergies/1
  # GET /medical_record_allergies/1.json
  def show
  end

  # GET /medical_record_allergies/new
  def new
    medical_record = MedicalRecord.find(params[:record_id])

    @medical_record_allergy = MedicalRecordAllergy.new(medical_record_id: medical_record.id)
    
    @allergies = Allergy.all
    @allergy_categories = AllergyCategory.all


  end

  # GET /medical_record_allergies/1/edit
  def edit
    @allergies = Allergy.all
    @allergy_categories = AllergyCategory.all
  end

  # POST /medical_record_allergies
  # POST /medical_record_allergies.json
  def create
    @medical_record_allergy = current_user.medical_record_allergies.build(medical_record_allergy_params)
    
    respond_to do |format|
      if @medical_record_allergy.save
        @medical_record_allergies = MedicalRecordAllergy.all

        format.html { redirect_to @medical_record_allergy, notice: 'Medical record allergy was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record_allergy }
        format.js
      else
        format.html { render :new }
        format.json { render json: @medical_record_allergy.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medical_record_allergies/1
  # PATCH/PUT /medical_record_allergies/1.json
  def update
    respond_to do |format|
      if @medical_record_allergy.update(medical_record_allergy_params)
        @medical_record_allergies = MedicalRecordAllergy.all

        format.html { redirect_to @medical_record_allergy, notice: 'Medical record allergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record_allergy }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @medical_record_allergy.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @medical_record_allergy = MedicalRecordAllergy.find(params[:medical_record_allergy_id])
  end


  # DELETE /medical_record_allergies/1
  # DELETE /medical_record_allergies/1.json
  def destroy
    @medical_record_allergy.destroy
    respond_to do |format|
      format.html { redirect_to medical_record_allergies_url, notice: 'Medical record allergy was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record_allergy
      @medical_record_allergy = MedicalRecordAllergy.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_allergy_params
      params.require(:medical_record_allergy).permit(:medical_record_id, :allergy_id, :notes)
    end
end
