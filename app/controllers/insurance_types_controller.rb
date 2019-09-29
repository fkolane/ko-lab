class InsuranceTypesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_insurance_type, only: [:show, :edit, :update, :destroy]

  # GET /insurance_types
  # GET /insurance_types.json
  def index
    @insurance_types = InsuranceType.all
  end

  # GET /insurance_types/1
  # GET /insurance_types/1.json
  def show
  end

  # GET /insurance_types/new
  def new
    @insurance_type = InsuranceType.new
  end

  # GET /insurance_types/1/edit
  def edit
  end

  # POST /insurance_types
  # POST /insurance_types.json
  def create
    @insurance_type = current_user.insurance_types.build(insurance_type_params)

    respond_to do |format|
      if @insurance_type.save
        @insurance_types = InsuranceType.all
        format.html { redirect_to @insurance_type, notice: 'Insurance type was successfully created.' }
        format.json { render :show, status: :created, location: @insurance_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /insurance_types/1
  # PATCH/PUT /insurance_types/1.json
  def update
    respond_to do |format|
      if @insurance_type.update(insurance_type_params)
        @insurance_types = InsuranceType.all
        format.html { redirect_to @insurance_type, notice: 'Insurance type was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @insurance_type = InsuranceType.find(params[:insurance_type_id])
  end



  # DELETE /insurance_types/1
  # DELETE /insurance_types/1.json
  def destroy
    @insurance_type.destroy
    @insurance_types = InsuranceType.all
    respond_to do |format|
      format.html { redirect_to insurance_types_url, notice: 'Insurance type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_type
      @insurance_type = InsuranceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_type_params
      params.require(:insurance_type).permit(:name, :description)
    end
end
