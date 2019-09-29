class InsurancesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  # GET /insurances
  # GET /insurances.json
  def index
    @insurances = Insurance.all
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
    @insurance_types = InsuranceType.all
  end

  # GET /insurances/1/edit
  def edit
    @insurance_types = InsuranceType.all
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = current_user.insurances.build(insurance_params)

    respond_to do |format|
      if @insurance.save
        @insurances = Insurance.all
        format.html { redirect_to @insurance, notice: 'Insurance was successfully created.' }
        format.json { render :show, status: :created, location: @insurance }
        format.js
      else
        format.html { render :new }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /insurances/1
  # PATCH/PUT /insurances/1.json
  def update
    respond_to do |format|
      if @insurance.update(insurance_params)
        @insurances = Insurance.all

        format.html { redirect_to @insurance, notice: 'Insurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @insurance = Insurance.find(params[:insurance_id])
  end


  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
    @insurance.destroy
    @insurances = Insurance.all
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_params
      params.require(:insurance).permit(:insurance_type_id, :name, :limited, :limit_age, :description)
    end
end
