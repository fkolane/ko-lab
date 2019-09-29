class TransfersController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new

    @services = Service.all
    @patients = Patient.all
    @prestations = Prestation.all

    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end


    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit

    @services = Service.all
    @patients = Patient.all
    @prestations = Prestation.all

    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end


  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = current_user.transfers.build(transfer_params)

    respond_to do |format|
      if @transfer.save
        @transfers = Transfer.all

        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
        format.js
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        @transfers = Transfer.all

        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @transfer = Transfer.find(params[:transfer_id])
  end


  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    @transfers = Transfer.all

    respond_to do |format|
      format.html { redirect_to transfers_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:patient_id,  :service_id, :doctor_id,  :destination_service_id, :reason, :destination_doctor_id, :notes)
    end
end
