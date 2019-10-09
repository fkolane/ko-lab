class AnalyseElementsController < ApplicationController
  before_action :set_analyse_element, only: [:show, :edit, :update, :destroy]

  # GET /analyse_elements
  # GET /analyse_elements.json
  def index
    @analyse_elements = AnalyseElement.all
  end

  # GET /analyse_elements/1
  # GET /analyse_elements/1.json
  def show
  end

  # GET /analyse_elements/new
  def new
    @analyse_element = AnalyseElement.new
  end

  # GET /analyse_elements/1/edit
  def edit
  end

  # POST /analyse_elements
  # POST /analyse_elements.json
  def create
    @analyse_element = AnalyseElement.new(analyse_element_params)

    respond_to do |format|
      if @analyse_element.save
        format.html { redirect_to @analyse_element, notice: 'Analyse element was successfully created.' }
        format.json { render :show, status: :created, location: @analyse_element }
      else
        format.html { render :new }
        format.json { render json: @analyse_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyse_elements/1
  # PATCH/PUT /analyse_elements/1.json
  def update
    respond_to do |format|
      if @analyse_element.update(analyse_element_params)
        format.html { redirect_to @analyse_element, notice: 'Analyse element was successfully updated.' }
        format.json { render :show, status: :ok, location: @analyse_element }
      else
        format.html { render :edit }
        format.json { render json: @analyse_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyse_elements/1
  # DELETE /analyse_elements/1.json
  def destroy
    @analyse_element.destroy
    respond_to do |format|
      format.html { redirect_to analyse_elements_url, notice: 'Analyse element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyse_element
      @analyse_element = AnalyseElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyse_element_params
      params.require(:analyse_element).permit(:analyse_id, :name, :normal_value, :status)
    end
end
