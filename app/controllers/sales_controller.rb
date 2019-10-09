class SalesController < ApplicationController
  include FilterMedicamentsConcern

  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  def get_medicament_price
    @medicament = Medicament.find(params[:data])
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @patients = Patient.all

    @medicaments = Medicament.all 
    @medicament_families = MedicamentFamily.all
  end

  # GET /sales/1/edit
  def edit
    @medicaments = Medicament.all 
    @medicament_families = MedicamentFamily.all
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = current_user.sales.build(sale_params)

    puts "Hummm sales con"
    medicament = Medicament.find(@sale.medicament_id)
    current_stock = (medicament.current_stock - @sale.quantity)
    medicament.update_columns(current_stock: current_stock)

    respond_to do |format|
      if @sale.save
        @sales = Sale.all
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        @sales = Sale.all
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @sale = Sale.find(params[:sale_id])
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    @sales = Sale.all
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:patient_type, :patient_id, :medicament_family_id, :medicament_id, :unit_price, :quantity, :vat, :total_amount)
    end
end
