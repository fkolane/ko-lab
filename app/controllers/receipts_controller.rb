class ReceiptsController < ApplicationController
  include FilterDoctorsConcern
  
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end


  def get_analysis_amount
    @analysis = Analysis.find(params[:data])
  end
  
  
  
  # GET /receipts/new
  def new
  
    @patients = Patient.all
    @analyses = Analysis.all

    


    

    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
    @services = Service.all
    @patients = Patient.all
    @analyses = Analysis.all
    @receipt.receipt_items

  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = current_user.receipts.build(receipt_params)

    respond_to do |format|
      if @receipt.save

        
        # Add into waiting list.

        waiting_list = WaitingList.new 
        waiting_list.receipt_id = @receipt.id
        #waiting_list.service_id = @receipt.service_id
        waiting_list.status = "Ouvert(e)"
        #waiting_list.user_id = @receipt.user_id
        waiting_list.save

        @receipts = Receipt.all

        format.html { redirect_to receipts_path, notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
        format.js
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        @receipts = Receipt.all

        format.html { redirect_to receipts_path, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @receipt = Receipt.find(params[:receipt_id])
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:patient_id, receipt_items_attributes: [:analysis_id, :price])
    end
end
