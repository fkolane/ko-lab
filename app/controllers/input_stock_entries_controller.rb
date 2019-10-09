class InputStockEntriesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_input_stock_entry, only: [:show, :edit, :update, :destroy]

  # GET /input_stock_entries
  # GET /input_stock_entries.json
  def index
    @input_stock_entries = InputStockEntry.all
  end


  def get_inputs

    @inputs = Input.where(input_type_id: params[:data])
    @inputs = @inputs.map{|a| [a.name, a.id ]}.insert(0, "Sélectionner")

  end

  # GET /input_stock_entries/1
  # GET /input_stock_entries/1.json
  def show
  end

  # GET /input_stock_entries/new
  def new
    @input_types = InputType.all 
    @inputs = Input.all 
    @providers = Provider.all
    @input_stock_entry = InputStockEntry.new
  end

  # GET /input_stock_entries/1/edit
  def edit
  end

  # POST /input_stock_entries
  # POST /input_stock_entries.json
  def create
    @input_stock_entry = current_user.input_stock_entries.build(input_stock_entry_params)
    input = Input.find(@input_stock_entry.input_id)
    current_stock = (input.current_stock + @input_stock_entry.quantity)
    input.update_columns(current_stock: current_stock)

    respond_to do |format|
      if @input_stock_entry.save
        @input_stock_entries = InputStockEntry.all

        format.html { redirect_to @input_stock_entry, notice: 'Input stock entry was successfully created.' }
        format.json { render :show, status: :created, location: @input_stock_entry }
        format.js
      else
        format.html { render :new }
        format.json { render json: @input_stock_entry.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /input_stock_entries/1
  # PATCH/PUT /input_stock_entries/1.json
  def update
    respond_to do |format|
      if @input_stock_entry.update(input_stock_entry_params)
        @input_stock_entries = InputStockEntry.all

        format.html { redirect_to @input_stock_entry, notice: 'Input stock entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @input_stock_entry }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @input_stock_entry.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @input_stock_entry = InputStockEntry.find(params[:input_stock_entry_id])
  end


  # DELETE /input_stock_entries/1
  # DELETE /input_stock_entries/1.json
  def destroy
    @input_stock_entry.destroy
    @input_stock_entries = InputStockEntry.all

    respond_to do |format|
      format.html { redirect_to input_stock_entries_url, notice: 'Input stock entry was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_stock_entry
      @input_stock_entry = InputStockEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_stock_entry_params
      params.require(:input_stock_entry).permit(:input_type_id, :input_id, :reason, :provider_id, :quantity, :unit, :delivery_number)
    end
end
