class InsuranceMedicamentsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_insurance_medicament, only: [:show, :edit, :update, :destroy]

  # GET /insurance_medicaments
  # GET /insurance_medicaments.json
  def index
    @insurance_medicaments = InsuranceMedicament.all
  end

  # GET /insurance_medicaments/1
  # GET /insurance_medicaments/1.json
  def show
  end

  # GET /insurance_medicaments/new
  def new
    @insurance_medicament = InsuranceMedicament.new
    @medicaments = Medicament.all
    @insurances = Insurance.all
  end

  # GET /insurance_medicaments/1/edit
  def edit
    @medicaments = Medicament.all
    @insurances = Insurance.all
  end

  # POST /insurance_medicaments
  # POST /insurance_medicaments.json
  def create
    @insurance_medicament = current_user.insurance_medicaments.build(insurance_medicament_params)

    respond_to do |format|
      if @insurance_medicament.save
        @insurance_medicaments = InsuranceMedicament.all


        format.html { redirect_to @insurance_medicament, notice: 'Insurance medicament was successfully created.' }
        format.json { render :show, status: :created, location: @insurance_medicament }
        format.js
      else
        format.html { render :new }
        format.json { render json: @insurance_medicament.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /insurance_medicaments/1
  # PATCH/PUT /insurance_medicaments/1.json
  def update
    respond_to do |format|
      if @insurance_medicament.update(insurance_medicament_params)
        @insurance_medicaments = InsuranceMedicament.all

        format.html { redirect_to @insurance_medicament, notice: 'Insurance medicament was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_medicament }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @insurance_medicament.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @insurance_medicament = InsuranceMedicament.find(params[:insurance_medicament_id])
  end

  # DELETE /insurance_medicaments/1
  # DELETE /insurance_medicaments/1.json
  def destroy
    @insurance_medicament.destroy
    @insurance_medicaments = InsuranceMedicament.all

    respond_to do |format|
      format.html { redirect_to insurance_medicaments_url, notice: 'Insurance medicament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_medicament
      @insurance_medicament = InsuranceMedicament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_medicament_params
      params.require(:insurance_medicament).permit(:insurance_id, :medicament_id, :percentage, :status, :user_id)
    end
end
