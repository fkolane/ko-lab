class GuardListsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_guard_list, only: [:show, :edit, :update, :destroy]

  # GET /guard_lists
  # GET /guard_lists.json
  def index
    @guard_lists = GuardList.all
  end

  # GET /guard_lists/1
  # GET /guard_lists/1.json
  def show
  end

  # GET /guard_lists/new
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


    @guard_list = GuardList.new
  end

  # GET /guard_lists/1/edit
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

  # POST /guard_lists
  # POST /guard_lists.json
  def create
    @guard_list = current_user.guard_list.build(guard_list_params)

    respond_to do |format|
      if @guard_list.save
        @guard_lists = GuardList.all

        format.html { redirect_to @guard_list, notice: 'Garde list was successfully created.' }
        format.json { render :show, status: :created, location: @guard_list }
        format.js
      else
        format.html { render :new }
        format.json { render json: @guard_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /guard_lists/1
  # PATCH/PUT /guard_lists/1.json
  def update
    respond_to do |format|
      if @guard_list.update(guard_list_params)
        @guard_lists = GuardList.all

        format.html { redirect_to @guard_list, notice: 'Garde list was successfully updated.' }
        format.json { render :show, status: :ok, location: @guard_list }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @guard_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @guard_list = GardeList.find(params[:guard_list_id])
  end



  # DELETE /guard_lists/1
  # DELETE /guard_lists/1.json
  def destroy
    @guard_list.destroy
    @guard_lists = GuardList.all

    respond_to do |format|
      format.html { redirect_to guard_lists_url, notice: 'Garde list was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guard_list
      @guard_list = GardeList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guard_list_params
      params.require(:guard_list).permit(:service_id, :doctor_id, :guard_date, :start_hour, :end_hour)
    end
end
