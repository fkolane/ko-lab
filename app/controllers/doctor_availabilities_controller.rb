class DoctorAvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_doctor_availability, only: [:show, :edit, :update, :destroy]

  # GET /doctor_availabilities
  # GET /doctor_availabilities.json
  def index
    @doctor_availabilities = DoctorAvailability.all
  end

  # GET /doctor_availabilities/1
  # GET /doctor_availabilities/1.json
  def show
  end

  # GET /doctor_availabilities/new
  def new

    @services = Service.all
  
    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end


    @doctor_availability = DoctorAvailability.new
  end

  # GET /doctor_availabilities/1/edit
  def edit

    @services = Service.all
   

    @users = User.where(role_id: Role.find_by(name: "Médecin").id)
    
    puts "Docteurs: #{@users.inspect}"

    @doctors = []

    @users.map do |user| 
      if user.profile
        
        @doctors.push(user.profile)
      end
    end


  end

  # POST /doctor_availabilities
  # POST /doctor_availabilities.json
  def create
    @doctor_availability = current_user.doctor_availabilities.build(doctor_availability_params)

    respond_to do |format|
      if @doctor_availability.save
        @doctor_availabilities = DoctorAvailability.all

        format.html { redirect_to @doctor_availability, notice: 'Doctor availability was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_availability }
        format.js
      else
        format.html { render :new }
        format.json { render json: @doctor_availability.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /doctor_availabilities/1
  # PATCH/PUT /doctor_availabilities/1.json
  def update
    respond_to do |format|
      if @doctor_availability.update(doctor_availability_params)
        @doctor_availabilities = DoctorAvailability.all

        format.html { redirect_to @doctor_availability, notice: 'Doctor availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_availability }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @doctor_availability.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @doctor_availability = DoctorAvailability.find(params[:doctor_availability_id])
  end


  # DELETE /doctor_availabilities/1
  # DELETE /doctor_availabilities/1.json
  def destroy
    @doctor_availability.destroy
    @doctor_availabilities = DoctorAvailability.all

    respond_to do |format|
      format.html { redirect_to doctor_availabilities_url, notice: 'Doctor availability was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_availability
      @doctor_availability = DoctorAvailability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_availability_params
      params.require(:doctor_availability).permit(:service_id, :doctor_id, :day, :start_hour, :end_hour)
    end
end
