class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @receipt = Receipt.find(params[:r])
    @analysis_elements = AnalyseElement.where(analysis_id: params[:a] )
    
    puts "R: #{@receipt}, A:"
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = current_user.results.build(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to receipt_analyses_path(@result.receipt_id), notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
        format.js
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
        format.js

      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:receipt_id, result_items_attributes: [:analysis_id, :sample_type_id, :analyse_element_id, :normal_value, :result_value, :comment, :_destroy])
    end
end
