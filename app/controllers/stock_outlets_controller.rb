class StockOutletsController < ApplicationController
  include FilterMedicamentsConcern

  before_action :authenticate_user!

  layout "dashboard"

  before_action :set_stock_outlet, only: [:show, :edit, :update, :destroy]

  # GET /stock_outlets
  # GET /stock_outlets.json
  def index
    @stock_outlets = StockOutlet.all
  end

  # GET /stock_outlets/1
  # GET /stock_outlets/1.json
  def show
  end

  # GET /stock_outlets/new
  def new
    @stock_outlet = StockOutlet.new
    @medicaments = Medicament.all 
    @medicament_families = MedicamentFamily.all
  end

  # GET /stock_outlets/1/edit
  def edit
    @medicaments = Medicament.all 
    @medicament_families = MedicamentFamily.all
  end

  # POST /stock_outlets
  # POST /stock_outlets.json
  def create
    @stock_outlet = current_user.stock_outlets.build(stock_outlet_params)

    medicament = Medicament.find(@stock_outlet.medicament_id)
    current_stock = (medicament.current_stock - @stock_outlet.quantity)
    medicament.update_columns(current_stock: current_stock)

    respond_to do |format|
      if @stock_outlet.save

        @stock_outlets = StockOutlet.all
        format.html { redirect_to @stock_outlet, notice: 'Stock outlet was successfully created.' }
        format.json { render :show, status: :created, location: @stock_outlet }
        format.js
      else
        format.html { render :new }
        format.json { render json: @stock_outlet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /stock_outlets/1
  # PATCH/PUT /stock_outlets/1.json
  def update
    respond_to do |format|
      if @stock_outlet.update(stock_outlet_params)
        @stock_outlets = StockOutlet.all
        format.html { redirect_to @stock_outlet, notice: 'Stock outlet was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_outlet }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @stock_outlet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @stock_outlet = StockOutlet.find(params[:stock_outlet_id])
  end

  # DELETE /stock_outlets/1
  # DELETE /stock_outlets/1.json
  def destroy
    @stock_outlet.destroy
    @stock_outlets = StockOutlet.all
    respond_to do |format|
      format.html { redirect_to stock_outlets_url, notice: 'Stock outlet was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_outlet
      @stock_outlet = StockOutlet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_outlet_params
      params.require(:stock_outlet).permit(:medicament_family_id, :medicament_id, :reason, :quantity, :unit)
    end
end
