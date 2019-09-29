class AllergiesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_allergy, only: [:show, :edit, :update, :destroy]

  # GET /allergies
  # GET /allergies.json
  def index
    @allergies = Allergy.all
  end

  def allergies
    @allergies = Allergy.all
    @allergy_categories = AllergyCategory.all
  end

  # GET /allergies/1
  # GET /allergies/1.json
  def show
  end

  # GET /allergies/new
  def new
    @allergy = Allergy.new
    @allergy_categories = AllergyCategory.all
  end

  # GET /allergies/1/edit
  def edit
    @allergy_categories = AllergyCategory.all

  end

  # POST /allergies
  # POST /allergies.json
  def create
    @allergy = current_user.allergies.build(allergy_params)

    respond_to do |format|
      if @allergy.save
        @allergies = Allergy.all

        format.html { redirect_to @allergy, notice: 'Allergy was successfully created.' }
        format.json { render :show, status: :created, location: @allergy }
        format.js
      else
        format.html { render :new }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /allergies/1
  # PATCH/PUT /allergies/1.json
  def update
    respond_to do |format|
      if @allergy.update(allergy_params)
        @allergies = Allergy.all

        format.html { redirect_to @allergy, notice: 'Allergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergy }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @allergy = Allergy.find(params[:allergy_id])
  end


  # DELETE /allergies/1
  # DELETE /allergies/1.json
  def destroy
    @allergy.destroy
    @allergies = Allergy.all

    respond_to do |format|
      format.html { redirect_to allergies_url, notice: 'Allergy was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergy
      @allergy = Allergy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergy_params
      params.require(:allergy).permit(:allergy_category_id, :name, :description)
    end
end
