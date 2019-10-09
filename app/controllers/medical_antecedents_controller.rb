class MedicalAntecedentsController < ApplicationController
  before_action :set_medical_antecedent, only: [:show, :edit, :update, :destroy]

  # GET /medical_antecedents
  # GET /medical_antecedents.json
  def index
    @medical_antecedents = MedicalAntecedent.all
  end

  # GET /medical_antecedents/1
  # GET /medical_antecedents/1.json
  def show
  end

  # GET /medical_antecedents/new
  def new
    @medical_antecedent = MedicalAntecedent.new
  end

  # GET /medical_antecedents/1/edit
  def edit
  end

  # POST /medical_antecedents
  # POST /medical_antecedents.json
  def create
    @medical_antecedent = MedicalAntecedent.new(medical_antecedent_params)

    respond_to do |format|
      if @medical_antecedent.save
        format.html { redirect_to @medical_antecedent, notice: 'Medical antecedent was successfully created.' }
        format.json { render :show, status: :created, location: @medical_antecedent }
      else
        format.html { render :new }
        format.json { render json: @medical_antecedent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_antecedents/1
  # PATCH/PUT /medical_antecedents/1.json
  def update
    respond_to do |format|
      if @medical_antecedent.update(medical_antecedent_params)
        format.html { redirect_to @medical_antecedent, notice: 'Medical antecedent was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_antecedent }
      else
        format.html { render :edit }
        format.json { render json: @medical_antecedent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_antecedents/1
  # DELETE /medical_antecedents/1.json
  def destroy
    @medical_antecedent.destroy
    respond_to do |format|
      format.html { redirect_to medical_antecedents_url, notice: 'Medical antecedent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_antecedent
      @medical_antecedent = MedicalAntecedent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_antecedent_params
      params.require(:medical_antecedent).permit(:consultation_id, :hta, :diabetes, :sickle_cell_disease, :asthma, :tuberculosis, :ugd, :others, :status)
    end
end
