class InputStockOutletsController < ApplicationController
  before_action :set_input_stock_outlet, only: [:show, :edit, :update, :destroy]

  # GET /input_stock_outlets
  # GET /input_stock_outlets.json
  def index
    @input_stock_outlets = InputStockOutlet.all
  end

  # GET /input_stock_outlets/1
  # GET /input_stock_outlets/1.json
  def show
  end

  # GET /input_stock_outlets/new
  def new
    @input_stock_outlet = InputStockOutlet.new
  end

  # GET /input_stock_outlets/1/edit
  def edit
  end

  # POST /input_stock_outlets
  # POST /input_stock_outlets.json
  def create
    @input_stock_outlet = InputStockOutlet.new(input_stock_outlet_params)

    respond_to do |format|
      if @input_stock_outlet.save
        format.html { redirect_to @input_stock_outlet, notice: 'Input stock outlet was successfully created.' }
        format.json { render :show, status: :created, location: @input_stock_outlet }
      else
        format.html { render :new }
        format.json { render json: @input_stock_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_stock_outlets/1
  # PATCH/PUT /input_stock_outlets/1.json
  def update
    respond_to do |format|
      if @input_stock_outlet.update(input_stock_outlet_params)
        format.html { redirect_to @input_stock_outlet, notice: 'Input stock outlet was successfully updated.' }
        format.json { render :show, status: :ok, location: @input_stock_outlet }
      else
        format.html { render :edit }
        format.json { render json: @input_stock_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_stock_outlets/1
  # DELETE /input_stock_outlets/1.json
  def destroy
    @input_stock_outlet.destroy
    respond_to do |format|
      format.html { redirect_to input_stock_outlets_url, notice: 'Input stock outlet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_stock_outlet
      @input_stock_outlet = InputStockOutlet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_stock_outlet_params
      params.require(:input_stock_outlet).permit(:user_id)
    end
end
