class MedicalSpecialitiesController < ApplicationController
  before_action :set_medical_speciality, only: [:show, :edit, :update, :destroy]

  # GET /medical_specialities
  # GET /medical_specialities.json
  def index
    @medical_specialities = MedicalSpeciality.all
  end

  # GET /medical_specialities/1
  # GET /medical_specialities/1.json
  def show
  end

  # GET /medical_specialities/new
  def new
    @medical_speciality = MedicalSpeciality.new
  end

  # GET /medical_specialities/1/edit
  def edit
  end

  # POST /medical_specialities
  # POST /medical_specialities.json
  def create
    @medical_speciality = MedicalSpeciality.new(medical_speciality_params)

    respond_to do |format|
      if @medical_speciality.save
        format.html { redirect_to @medical_speciality, notice: 'Medical speciality was successfully created.' }
        format.json { render :show, status: :created, location: @medical_speciality }
      else
        format.html { render :new }
        format.json { render json: @medical_speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_specialities/1
  # PATCH/PUT /medical_specialities/1.json
  def update
    respond_to do |format|
      if @medical_speciality.update(medical_speciality_params)
        format.html { redirect_to @medical_speciality, notice: 'Medical speciality was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_speciality }
      else
        format.html { render :edit }
        format.json { render json: @medical_speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_specialities/1
  # DELETE /medical_specialities/1.json
  def destroy
    @medical_speciality.destroy
    respond_to do |format|
      format.html { redirect_to medical_specialities_url, notice: 'Medical speciality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_speciality
      @medical_speciality = MedicalSpeciality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_speciality_params
      params.require(:medical_speciality).permit(:name, :description, :status, :user_id)
    end
end
