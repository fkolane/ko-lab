class DiagnosticHypothesesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_diagnostic_hypothesis, only: [:show, :edit, :update, :destroy]

  # GET /diagnostic_hypotheses
  # GET /diagnostic_hypotheses.json
  def index
    @diagnostic_hypotheses = DiagnosticHypothesis.all
  end

  # GET /diagnostic_hypotheses/1
  # GET /diagnostic_hypotheses/1.json
  def show
  end

  # GET /diagnostic_hypotheses/new
  def new
    @diagnostic_hypothesis = DiagnosticHypothesis.new
  end

  # GET /diagnostic_hypotheses/1/edit
  def edit
  end

  # POST /diagnostic_hypotheses
  # POST /diagnostic_hypotheses.json
  def create
    @diagnostic_hypothesis = current_user.diagnostic_hypotheses.build(diagnostic_hypothesis_params)

    respond_to do |format|
      if @diagnostic_hypothesis.save
        @diagnostic_hypotheses = DiagnosticHypothesis.all

        format.html { redirect_to @diagnostic_hypothesis, notice: 'Diagnostic hypothesis was successfully created.' }
        format.json { render :show, status: :created, location: @diagnostic_hypothesis }
        format.js
      else
        format.html { render :new }
        format.json { render json: @diagnostic_hypothesis.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /diagnostic_hypotheses/1
  # PATCH/PUT /diagnostic_hypotheses/1.json
  def update
    respond_to do |format|
      if @diagnostic_hypothesis.update(diagnostic_hypothesis_params)
        @diagnostic_hypotheses = DiagnosticHypothesis.all

        format.html { redirect_to @diagnostic_hypothesis, notice: 'Diagnostic hypothesis was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnostic_hypothesis }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @diagnostic_hypothesis.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @diagnostic_hypothesis = DiagnosticHypothesis.find(params[:diagnostic_hypothesis_id])
  end


  # DELETE /diagnostic_hypotheses/1
  # DELETE /diagnostic_hypotheses/1.json
  def destroy
    @diagnostic_hypothesis.destroy
    @diagnostic_hypotheses = DiagnosticHypothesis.all

    respond_to do |format|
      format.html { redirect_to diagnostic_hypotheses_url, notice: 'Diagnostic hypothesis was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_hypothesis
      @diagnostic_hypothesis = DiagnosticHypothesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnostic_hypothesis_params
      params.require(:diagnostic_hypothesis).permit(:name, :description)
    end
end
