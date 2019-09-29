class HospitalizationsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_hospitalization, only: [:show, :edit, :update, :destroy]

  # GET /hospitalizations
  # GET /hospitalizations.json
  def index
    @hospitalizations = Hospitalization.all
  end

  # GET /hospitalizations/1
  # GET /hospitalizations/1.json
  def show
  end

  # GET /hospitalizations/new
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

    @rooms = Room.all

    @hospitalization = Hospitalization.new
  end

  # GET /hospitalizations/1/edit
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

    @rooms = Room.all

    
  end

  # POST /hospitalizations
  # POST /hospitalizations.json
  def create
    @hospitalization = current_user.hospitalizations.build(hospitalization_params)

    respond_to do |format|
      if @hospitalization.save
        @hospitalizations = Hospitalization.all

        format.html { redirect_to @hospitalization, notice: 'Hospitalization was successfully created.' }
        format.json { render :show, status: :created, location: @hospitalization }
        format.js
      else
        format.html { render :new }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /hospitalizations/1
  # PATCH/PUT /hospitalizations/1.json
  def update
    respond_to do |format|
      if @hospitalization.update(hospitalization_params)
        @hospitalizations = Hospitalization.all


        format.html { redirect_to @hospitalization, notice: 'Hospitalization was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospitalization }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @hospitalization = Hospitalization.find(params[:hospitalization_id])
  end

  # DELETE /hospitalizations/1
  # DELETE /hospitalizations/1.json
  def destroy
    @hospitalization.destroy
    @hospitalizations = Hospitalization.all

    respond_to do |format|
      format.html { redirect_to hospitalizations_url, notice: 'Hospitalization was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospitalization
      @hospitalization = Hospitalization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospitalization_params
      params.require(:hospitalization).permit(:patient_id,  :service_id, :doctor_id, :room_id, :bed_number, :notes)
    end
end
