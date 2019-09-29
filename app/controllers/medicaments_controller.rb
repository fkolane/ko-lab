class MedicamentsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_medicament, only: [:show, :edit, :update, :destroy]

  # GET /medicaments
  # GET /medicaments.json
  def index
    @medicaments = Medicament.all
  end

  # GET /medicaments/1
  # GET /medicaments/1.json
  def show
  end

  # GET /medicaments/new
  def new
    @medicament = Medicament.new
    @medicament_families = MedicamentFamily.all
    @providers = Provider.all
  end

  # GET /medicaments/1/edit
  def edit
    @medicament_families = MedicamentFamily.all
    @providers = Provider.all
  end

  # POST /medicaments
  # POST /medicaments.json
  def create
    @medicament = current_user.medicaments.build(medicament_params)

    respond_to do |format|
      if @medicament.save
        @medicaments = Medicament.all
        format.html { redirect_to @medicament, notice: 'Medicament was successfully created.' }
        format.json { render :show, status: :created, location: @medicament }
        format.js
      else
        format.html { render :new }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medicaments/1
  # PATCH/PUT /medicaments/1.json
  def update
    respond_to do |format|
      if @medicament.update(medicament_params)
        @medicaments = Medicament.all
        format.html { redirect_to @medicament, notice: 'Medicament was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicament }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @medicament = Medicament.find(params[:medicament_id])
  end

  # DELETE /medicaments/1
  # DELETE /medicaments/1.json
  def destroy
    @medicament.destroy
    @medicaments = Medicament.all
    respond_to do |format|
      format.html { redirect_to medicaments_url, notice: 'Medicament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicament
      @medicament = Medicament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_params
      params.require(:medicament).permit(:medicament_family_id, :name, :description, :dosage, :presentation, :administration_method)
    end
end
