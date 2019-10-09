class SurgicalAntecedentsController < ApplicationController
  before_action :set_surgical_antecedent, only: [:show, :edit, :update, :destroy]

  # GET /surgical_antecedents
  # GET /surgical_antecedents.json
  def index
    @surgical_antecedents = SurgicalAntecedent.all
  end

  # GET /surgical_antecedents/1
  # GET /surgical_antecedents/1.json
  def show
  end

  # GET /surgical_antecedents/new
  def new
    @surgical_antecedent = SurgicalAntecedent.new
  end

  # GET /surgical_antecedents/1/edit
  def edit
  end

  # POST /surgical_antecedents
  # POST /surgical_antecedents.json
  def create
    @surgical_antecedent = SurgicalAntecedent.new(surgical_antecedent_params)

    respond_to do |format|
      if @surgical_antecedent.save
        format.html { redirect_to @surgical_antecedent, notice: 'Surgical antecedent was successfully created.' }
        format.json { render :show, status: :created, location: @surgical_antecedent }
      else
        format.html { render :new }
        format.json { render json: @surgical_antecedent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surgical_antecedents/1
  # PATCH/PUT /surgical_antecedents/1.json
  def update
    respond_to do |format|
      if @surgical_antecedent.update(surgical_antecedent_params)
        format.html { redirect_to @surgical_antecedent, notice: 'Surgical antecedent was successfully updated.' }
        format.json { render :show, status: :ok, location: @surgical_antecedent }
      else
        format.html { render :edit }
        format.json { render json: @surgical_antecedent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surgical_antecedents/1
  # DELETE /surgical_antecedents/1.json
  def destroy
    @surgical_antecedent.destroy
    respond_to do |format|
      format.html { redirect_to surgical_antecedents_url, notice: 'Surgical antecedent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surgical_antecedent
      @surgical_antecedent = SurgicalAntecedent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surgical_antecedent_params
      params.require(:surgical_antecedent).permit(:present, :name, :consultation_id, :status)
    end
end
