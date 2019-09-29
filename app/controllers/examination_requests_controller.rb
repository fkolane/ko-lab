class ExaminationRequestsController < ApplicationController
  before_action :set_examination_request, only: [:show, :edit, :update, :destroy]

  # GET /examination_requests
  # GET /examination_requests.json
  def index
    @examination_requests = ExaminationRequest.all
  end

  # GET /examination_requests/1
  # GET /examination_requests/1.json
  def show
  end

  # GET /examination_requests/new
  def new
    @examination_request = ExaminationRequest.new
  end

  # GET /examination_requests/1/edit
  def edit
  end

  # POST /examination_requests
  # POST /examination_requests.json
  def create
    @examination_request = ExaminationRequest.new(examination_request_params)

    respond_to do |format|
      if @examination_request.save
        format.html { redirect_to @examination_request, notice: 'Examination request was successfully created.' }
        format.json { render :show, status: :created, location: @examination_request }
      else
        format.html { render :new }
        format.json { render json: @examination_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examination_requests/1
  # PATCH/PUT /examination_requests/1.json
  def update
    respond_to do |format|
      if @examination_request.update(examination_request_params)
        format.html { redirect_to @examination_request, notice: 'Examination request was successfully updated.' }
        format.json { render :show, status: :ok, location: @examination_request }
      else
        format.html { render :edit }
        format.json { render json: @examination_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examination_requests/1
  # DELETE /examination_requests/1.json
  def destroy
    @examination_request.destroy
    respond_to do |format|
      format.html { redirect_to examination_requests_url, notice: 'Examination request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examination_request
      @examination_request = ExaminationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def examination_request_params
      params.require(:examination_request).permit(:exam_type_id, :reason, :patient_id, :medical_record_id, :doctor_id, :status, :user_id)
    end
end
