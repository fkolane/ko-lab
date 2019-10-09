class ArrivalMailsController < ApplicationController
  before_action :authenticate_user!
    layout "dashboard"
    

  before_action :set_arrival_mail, only: [:show, :edit, :update, :destroy]

  # GET /arrival_mails
  # GET /arrival_mails.json
  def index
    @arrival_mails = ArrivalMail.all
  end

  # GET /arrival_mails/1
  # GET /arrival_mails/1.json
  def show
  end

  # GET /arrival_mails/new
  def new
    @services = Service.all
    @users = User.all
    
    puts "Docteurs: #{@users.inspect}"

    @agents = []

    @users.map do |user| 
      if user.profile
        
        @agents.push(user.profile)
      end
    end

    @arrival_mail = ArrivalMail.new
  end

  # GET /arrival_mails/1/edit
  def edit
  end

  # POST /arrival_mails
  # POST /arrival_mails.json
  def create
    @arrival_mail = current_user.arrival_mails.build(arrival_mail_params)

    respond_to do |format|
      if @arrival_mail.save
        @arrival_mails = ArrivalMail.all

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully created.' }
        format.json { render :show, status: :created, location: @arrival_mail }
      else
        format.html { render :new }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arrival_mails/1
  # PATCH/PUT /arrival_mails/1.json
  def update
    respond_to do |format|
      if @arrival_mail.update(arrival_mail_params)
        format.html { redirect_to @arrival_mail, notice: 'Arrival mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrival_mail }
      else
        format.html { render :edit }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @arrival_mail = ArrivalMail.find(params[:arrival_mail_id])
  end

  # DELETE /arrival_mails/1
  # DELETE /arrival_mails/1.json
  def destroy
    @arrival_mail.destroy
    respond_to do |format|
      format.html { redirect_to arrival_mails_url, notice: 'Arrival mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival_mail
      @arrival_mail = ArrivalMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrival_mail_params
      params.require(:arrival_mail).permit(:arrival_date, :origin, :reference, :mail_date, :recipient, :nature, :object, :reserved_suite, imputations_attributes: [:service_id, :agent_id, :reason, :opinion])
    end
end
