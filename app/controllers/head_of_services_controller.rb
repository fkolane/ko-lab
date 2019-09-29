class HeadOfServicesController < ApplicationController
  before_action :set_head_of_service, only: [:show, :edit, :update, :destroy]

  # GET /head_of_services
  # GET /head_of_services.json
  def index
    @head_of_services = HeadOfService.all
  end

  # GET /head_of_services/1
  # GET /head_of_services/1.json
  def show
  end

  # GET /head_of_services/new
  def new
    @head_of_service = HeadOfService.new
  end

  # GET /head_of_services/1/edit
  def edit
  end

  # POST /head_of_services
  # POST /head_of_services.json
  def create
    @head_of_service = HeadOfService.new(head_of_service_params)

    respond_to do |format|
      if @head_of_service.save
        format.html { redirect_to @head_of_service, notice: 'Head of service was successfully created.' }
        format.json { render :show, status: :created, location: @head_of_service }
      else
        format.html { render :new }
        format.json { render json: @head_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /head_of_services/1
  # PATCH/PUT /head_of_services/1.json
  def update
    respond_to do |format|
      if @head_of_service.update(head_of_service_params)
        format.html { redirect_to @head_of_service, notice: 'Head of service was successfully updated.' }
        format.json { render :show, status: :ok, location: @head_of_service }
      else
        format.html { render :edit }
        format.json { render json: @head_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /head_of_services/1
  # DELETE /head_of_services/1.json
  def destroy
    @head_of_service.destroy
    respond_to do |format|
      format.html { redirect_to head_of_services_url, notice: 'Head of service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head_of_service
      @head_of_service = HeadOfService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def head_of_service_params
      params.require(:head_of_service).permit(:service_id, :profile_id, :user_id, :status)
    end
end
