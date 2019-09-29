class AllergyCategoriesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_allergy_category, only: [:show, :edit, :update, :destroy]

  # GET /allergy_categories
  # GET /allergy_categories.json
  def index
    @allergy_categories = AllergyCategory.all
  end

  # GET /allergy_categories/1
  # GET /allergy_categories/1.json
  def show
  end

  # GET /allergy_categories/new
  def new
    @allergy_category = AllergyCategory.new
  end

  # GET /allergy_categories/1/edit
  def edit
  end

  # POST /allergy_categories
  # POST /allergy_categories.json
  def create
    @allergy_category = current_user.allergy_categories.build(allergy_category_params)

    respond_to do |format|
      if @allergy_category.save
        @allergy_categories = AllergyCategory.all

        format.html { redirect_to @allergy_category, notice: 'Allergy category was successfully created.' }
        format.json { render :show, status: :created, location: @allergy_category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @allergy_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /allergy_categories/1
  # PATCH/PUT /allergy_categories/1.json
  def update
    respond_to do |format|
      if @allergy_category.update(allergy_category_params)
        @allergy_categories = AllergyCategory.all

        format.html { redirect_to @allergy_category, notice: 'Allergy category was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergy_category }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @allergy_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @allergy_category = AllergyCategory.find(params[:allergy_category_id])
  end

  # DELETE /allergy_categories/1
  # DELETE /allergy_categories/1.json
  def destroy
    @allergy_category.destroy
    @allergy_categories = AllergyCategory.all

    respond_to do |format|
      format.html { redirect_to allergy_categories_url, notice: 'Allergy category was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergy_category
      @allergy_category = AllergyCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergy_category_params
      params.require(:allergy_category).permit(:name, :description)
    end
end
