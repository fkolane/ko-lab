class InputStockEntriesController < ApplicationController
  before_action :set_input_stock_entry, only: [:show, :edit, :update, :destroy]

  # GET /input_stock_entries
  # GET /input_stock_entries.json
  def index
    @input_stock_entries = InputStockEntry.all
  end

  # GET /input_stock_entries/1
  # GET /input_stock_entries/1.json
  def show
  end

  # GET /input_stock_entries/new
  def new
    @input_stock_entry = InputStockEntry.new
  end

  # GET /input_stock_entries/1/edit
  def edit
  end

  # POST /input_stock_entries
  # POST /input_stock_entries.json
  def create
    @input_stock_entry = InputStockEntry.new(input_stock_entry_params)

    respond_to do |format|
      if @input_stock_entry.save
        format.html { redirect_to @input_stock_entry, notice: 'Input stock entry was successfully created.' }
        format.json { render :show, status: :created, location: @input_stock_entry }
      else
        format.html { render :new }
        format.json { render json: @input_stock_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_stock_entries/1
  # PATCH/PUT /input_stock_entries/1.json
  def update
    respond_to do |format|
      if @input_stock_entry.update(input_stock_entry_params)
        format.html { redirect_to @input_stock_entry, notice: 'Input stock entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @input_stock_entry }
      else
        format.html { render :edit }
        format.json { render json: @input_stock_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_stock_entries/1
  # DELETE /input_stock_entries/1.json
  def destroy
    @input_stock_entry.destroy
    respond_to do |format|
      format.html { redirect_to input_stock_entries_url, notice: 'Input stock entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_stock_entry
      @input_stock_entry = InputStockEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_stock_entry_params
      params.require(:input_stock_entry).permit(:user_id)
    end
end
