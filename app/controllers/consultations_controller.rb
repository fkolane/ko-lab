class ConsultationsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_consultation, only: [:show, :edit, :update, :destroy]

  # GET /consultations
  # GET /consultations.json
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
  end

  # GET /consultations/new
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

    @consultation = Consultation.new
  end

  # GET /consultations/1/edit
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

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = current_user.consultations.build(consultation_params)

    respond_to do |format|
      if @consultation.save
        @consultations = Consultation.all

        format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
        format.json { render :show, status: :created, location: @consultation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /consultations/1
  # PATCH/PUT /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        @consultations = Consultation.all

        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @consultation = Consultation.find(params[:consultation_id])
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation.destroy
    @consultations = Consultation.all

    respond_to do |format|
      format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.require(:consultation).permit(:patient_id,  :reason, :exit_diagnostic, :disease_history)
    end
end
