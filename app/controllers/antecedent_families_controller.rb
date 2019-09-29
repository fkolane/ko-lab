class AntecedentFamiliesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_antecedent_family, only: [:show, :edit, :update, :destroy]

  # GET /antecedent_families
  # GET /antecedent_families.json
  def index
    @antecedent_families = AntecedentFamily.all
  end

  # GET /antecedent_families/1
  # GET /antecedent_families/1.json
  def show
  end

  # GET /antecedent_families/new
  def new
    @antecedent_family = AntecedentFamily.new
  end

  # GET /antecedent_families/1/edit
  def edit
  end

  # POST /antecedent_families
  # POST /antecedent_families.json
  def create
    @antecedent_family = current_user.antecedent_families.build(antecedent_family_params)

    respond_to do |format|
      if @antecedent_family.save
        @antecedent_families = AntecedentFamily.all

        format.html { redirect_to @antecedent_family, notice: 'Antecedent family was successfully created.' }
        format.json { render :show, status: :created, location: @antecedent_family }
        format.js
      else
        format.html { render :new }
        format.json { render json: @antecedent_family.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /antecedent_families/1
  # PATCH/PUT /antecedent_families/1.json
  def update
    respond_to do |format|
      if @antecedent_family.update(antecedent_family_params)
        @antecedent_families = AntecedentFamily.all
        format.html { redirect_to @antecedent_family, notice: 'Antecedent family was successfully updated.' }
        format.json { render :show, status: :ok, location: @antecedent_family }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @antecedent_family.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @antecedent_family = AntecedentFamily.find(params[:antecedent_family_id])
  end


  # DELETE /antecedent_families/1
  # DELETE /antecedent_families/1.json
  def destroy
    @antecedent_family.destroy
    @antecedent_families = AntecedentFamily.all
    respond_to do |format|
      format.html { redirect_to antecedent_families_url, notice: 'Antecedent family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antecedent_family
      @antecedent_family = AntecedentFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antecedent_family_params
      params.require(:antecedent_family).permit(:name, :description, :status, :user_id)
    end
end
