class AnalyseTypesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_analyse_type, only: [:show, :edit, :update, :destroy]

  # GET /analyse_types
  # GET /analyse_types.json
  def index
    @analyse_types = AnalyseType.all
  end

  # GET /analyse_types/1
  # GET /analyse_types/1.json
  def show
  end

  # GET /analyse_types/new
  def new
    @analyse_type = AnalyseType.new
  end

  # GET /analyse_types/1/edit
  def edit
  end

  # POST /analyse_types
  # POST /analyse_types.json
  def create
    @analyse_type = current_user.analyse_types.build(analyse_type_params)

    respond_to do |format|
      if @analyse_type.save
        @analyse_types = AnalyseType.all

        format.html { redirect_to @analyse_type, notice: 'Analyse type was successfully created.' }
        format.json { render :show, status: :created, location: @analyse_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @analyse_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /analyse_types/1
  # PATCH/PUT /analyse_types/1.json
  def update
    respond_to do |format|
      if @analyse_type.update(analyse_type_params)
        format.html { redirect_to @analyse_type, notice: 'Analyse type was successfully updated.' }
        format.json { render :show, status: :ok, location: @analyse_type }
      else
        format.html { render :edit }
        format.json { render json: @analyse_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyse_types/1
  # DELETE /analyse_types/1.json
  def destroy
    @analyse_type.destroy
    respond_to do |format|
      format.html { redirect_to analyse_types_url, notice: 'Analyse type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyse_type
      @analyse_type = AnalyseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyse_type_params
      params.require(:analyse_type).permit(:name, :price, :normal_value, :description, :status, :user_id)
    end
end
