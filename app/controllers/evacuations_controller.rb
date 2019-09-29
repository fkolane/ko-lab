class EvacuationsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_evacuation, only: [:show, :edit, :update, :destroy]

  # GET /evacuations
  # GET /evacuations.json
  def index
    @evacuations = Evacuation.all
  end

  # GET /evacuations/1
  # GET /evacuations/1.json
  def show
  end

  # GET /evacuations/new
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


    @evacuation = Evacuation.new
  end

  # GET /evacuations/1/edit
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

  # POST /evacuations
  # POST /evacuations.json
  def create
    @evacuation = current_user.evacuations.build(evacuation_params)

    respond_to do |format|
      if @evacuation.save
        @evacuations = Evacuation.all

        format.html { redirect_to @evacuation, notice: 'Evacuation was successfully created.' }
        format.json { render :show, status: :created, location: @evacuation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @evacuation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /evacuations/1
  # PATCH/PUT /evacuations/1.json
  def update
    respond_to do |format|
      if @evacuation.update(evacuation_params)
        @evacuations = Evacuation.all

        format.html { redirect_to @evacuation, notice: 'Evacuation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evacuation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @evacuation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @evacuation = Evacuation.find(params[:evacuation_id])
  end

  # DELETE /evacuations/1
  # DELETE /evacuations/1.json
  def destroy
    @evacuation.destroy
    @evacuations = Evacuation.all

    respond_to do |format|
      format.html { redirect_to evacuations_url, notice: 'Evacuation was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evacuation
      @evacuation = Evacuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evacuation_params
      params.require(:evacuation).permit(:patient_id,  :service_id, :doctor_id, :destination_hospital, :destination_service, :reason, :notes, :status)
    end
end
