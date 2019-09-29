class SocialCasesController < ApplicationController
  before_action :set_social_case, only: [:show, :edit, :update, :destroy]

  # GET /social_cases
  # GET /social_cases.json
  def index
    @social_cases = SocialCase.all
  end

  # GET /social_cases/1
  # GET /social_cases/1.json
  def show
  end

  # GET /social_cases/new
  def new
    @social_case = SocialCase.new
  end

  # GET /social_cases/1/edit
  def edit
  end

  # POST /social_cases
  # POST /social_cases.json
  def create
    @social_case = SocialCase.new(social_case_params)

    respond_to do |format|
      if @social_case.save
        format.html { redirect_to @social_case, notice: 'Social case was successfully created.' }
        format.json { render :show, status: :created, location: @social_case }
      else
        format.html { render :new }
        format.json { render json: @social_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_cases/1
  # PATCH/PUT /social_cases/1.json
  def update
    respond_to do |format|
      if @social_case.update(social_case_params)
        format.html { redirect_to @social_case, notice: 'Social case was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_case }
      else
        format.html { render :edit }
        format.json { render json: @social_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_cases/1
  # DELETE /social_cases/1.json
  def destroy
    @social_case.destroy
    respond_to do |format|
      format.html { redirect_to social_cases_url, notice: 'Social case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_case
      @social_case = SocialCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_case_params
      params.require(:social_case).permit(:patient_id, :medical_record_id, :percentage, :status, :user_id)
    end
end
