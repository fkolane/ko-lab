class MedicamentFamiliesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
    

  before_action :set_medicament_family, only: [:show, :edit, :update, :destroy]

  # GET /medicament_famillies
  # GET /medicament_famillies.json
  def index
    @medicament_families = MedicamentFamily.all
  end

  # GET /medicament_famillies/1
  # GET /medicament_famillies/1.json
  def show
  end

  # GET /medicament_famillies/new
  def new
    @medicament_family = MedicamentFamily.new
  end

  # GET /medicament_famillies/1/edit
  def edit
  end

  # POST /medicament_famillies
  # POST /medicament_famillies.json
  def create
    @medicament_family = current_user.medicament_families.build(medicament_family_params)

    respond_to do |format|
      if @medicament_family.save
        @medicament_families = MedicamentFamily.all
        format.html { redirect_to @medicament_family, notice: 'Medicament familly was successfully created.' }
        format.json { render :show, status: :created, location: @medicament_family }
        format.js
      else
        format.html { render :new }
        format.json { render json: @medicament_family.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medicament_famillies/1
  # PATCH/PUT /medicament_famillies/1.json
  def update
    respond_to do |format|
      if @medicament_family.update(medicament_family_params)
        @medicament_families = MedicamentFamily.all
        format.html { redirect_to @medicament_family, notice: 'Medicament familly was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicament_family }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @medicament_family.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @medicament_family = MedicamentFamily.find(params[:medicament_family_id])
  end


  # DELETE /medicament_famillies/1
  # DELETE /medicament_famillies/1.json
  def destroy
    @medicament_family.destroy
    @medicament_families = MedicamentFamily.all
    respond_to do |format|
      format.html { redirect_to medicament_families_url, notice: 'Medicament family was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicament_family
      @medicament_family = MedicamentFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_family_params
      params.require(:medicament_family).permit(:name, :description)
    end
end
