class DoctorPlanningsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_doctor_planning, only: [:show, :edit, :update, :destroy]

  # GET /doctor_plannings
  # GET /doctor_plannings.json
  def index
    @doctor_plannings = DoctorPlanning.all
  end

  # GET /doctor_plannings/1
  # GET /doctor_plannings/1.json
  def show
  end

  # GET /doctor_plannings/new
  def new

    @services = Service.all
    @patients = Patient.all
    

    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end


    @doctor_planning = DoctorPlanning.new
  end

  # GET /doctor_plannings/1/edit
  def edit

    @services = Service.all
    @patients = Patient.all

    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end
  end

  # POST /doctor_plannings
  # POST /doctor_plannings.json
  def create
    @doctor_planning = current_user.doctor_plannings.build(doctor_planning_params)

    respond_to do |format|
      if @doctor_planning.save
        @doctor_plannings = DoctorPlanning.all

        format.html { redirect_to @doctor_planning, notice: 'Doctor planning was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_planning }
        format.js
      else
        format.html { render :new }
        format.json { render json: @doctor_planning.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /doctor_plannings/1
  # PATCH/PUT /doctor_plannings/1.json
  def update
    respond_to do |format|
      if @doctor_planning.update(doctor_planning_params)
        @doctor_plannings = DoctorPlanning.all

        format.html { redirect_to @doctor_planning, notice: 'Doctor planning was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_planning }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @doctor_planning.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @doctor_planning = DoctorPlanning.find(params[:doctor_planning_id])
  end

  # DELETE /doctor_plannings/1
  # DELETE /doctor_plannings/1.json
  def destroy
    @doctor_planning.destroy
    @doctor_plannings = DoctorPlanning.all

    respond_to do |format|
      format.html { redirect_to doctor_plannings_url, notice: 'Doctor planning was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_planning
      @doctor_planning = DoctorPlanning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_planning_params
      params.require(:doctor_planning).permit(:service_id, :doctor_id, :patient_id, :reason, :day, :start_hour, :end_hour)
    end
end
