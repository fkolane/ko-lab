class AnalysesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  # GET /analyses
  # GET /analyses.json
  def index
    @analyses = Analysis.all
  end


  def receipt_analyses
    receipt = params[:receipt]
    @receipt_items = ReceiptItem.where(receipt_id: receipt)
    puts "RECEIPT ID: #{receipt}"
  end
  # GET /analyses/1
  # GET /analyses/1.json
  def show
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit
    @analysis.analyse_elements #|| @user.build_profile 

  end

  # POST /analyses
  # POST /analyses.json
  def create
    @analysis = current_user.analyses.build(analysis_params)

    respond_to do |format|
      if @analysis.save
        format.html { redirect_to analyses_path, notice: 'Analyse was successfully created.' }
        format.json { render :show, status: :created, location: @analysis }
        format.js
      else
        format.html { render :new }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /analyses/1
  # PATCH/PUT /analyses/1.json
  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to analyses_path, notice: 'Analyse was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis }
        format.js

      else
        format.html { render :edit }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  def delete
    @analysis = Analysis.find(params[:analysis_id])
  end


  # DELETE /analyses/1
  # DELETE /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to analyses_url, notice: 'Analyse was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis
      @analysis = Analysis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_params
      params.require(:analysis).permit( :name, :price, :normal_value, analyse_elements_attributes: [:name, :normal_value])
    end
end
