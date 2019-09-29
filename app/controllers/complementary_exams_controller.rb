class ComplementaryExamsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_complementary_exam, only: [:show, :edit, :update, :destroy]

  # GET /complementary_exams
  # GET /complementary_exams.json
  def index
    @complementary_exams = ComplementaryExam.all
  end

  # GET /complementary_exams/1
  # GET /complementary_exams/1.json
  def show
  end

  # GET /complementary_exams/new
  def new
    @complementary_exam = ComplementaryExam.new

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

  # GET /complementary_exams/1/edit
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

  # POST /complementary_exams
  # POST /complementary_exams.json
  def create
    @complementary_exam = current_user.complementary_exams.build(complementary_exam_params)

    respond_to do |format|
      if @complementary_exam.save
        @complementary_exams = ComplementaryExam.all
        format.html { redirect_to @complementary_exam, notice: 'Complementary exam was successfully created.' }
        format.json { render :show, status: :created, location: @complementary_exam }
        format.js
      else
        format.html { render :new }
        format.json { render json: @complementary_exam.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /complementary_exams/1
  # PATCH/PUT /complementary_exams/1.json
  def update
    respond_to do |format|
      if @complementary_exam.update(complementary_exam_params)
        @complementary_exams = ComplementaryExam.all
        format.html { redirect_to @complementary_exam, notice: 'Complementary exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @complementary_exam }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @complementary_exam.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @complementary_exam = ComplementaryExam.find(params[:complementary_exam_id])
  end


  # DELETE /complementary_exams/1
  # DELETE /complementary_exams/1.json
  def destroy
    @complementary_exam.destroy
    @complementary_exams = ComplementaryExam.all
    respond_to do |format|
      format.html { redirect_to complementary_exams_url, notice: 'Complementary exam was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complementary_exam
      @complementary_exam = ComplementaryExam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complementary_exam_params
      params.require(:complementary_exam).permit(:patient_id, :service_id, :doctor_id, :prestation_id, :total_amount)
    end
end
