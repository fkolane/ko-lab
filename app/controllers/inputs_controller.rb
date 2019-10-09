class InputsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_input, only: [:show, :edit, :update, :destroy]

  # GET /inputs
  # GET /inputs.json
  def index
    @inputs = Input.all
  end

  # GET /inputs/1
  # GET /inputs/1.json
  def show
  end

  # GET /inputs/new
  def new
    @input_types = InputType.all
    @providers = Provider.all
    @input = Input.new
  end

  # GET /inputs/1/edit
  def edit
    @input_types = InputType.all
    @providers = Provider.all
  end

  # POST /inputs
  # POST /inputs.json
  def create
    @input = current_user.inputs.build(input_params)

    respond_to do |format|
      if @input.save
        @inputs = Input.all

        format.html { redirect_to @input, notice: 'Input was successfully created.' }
        format.json { render :show, status: :created, location: @input }
        format.js
      else
        format.html { render :new }
        format.json { render json: @input.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /inputs/1
  # PATCH/PUT /inputs/1.json
  def update
    respond_to do |format|
      if @input.update(input_params)
        @inputs = Input.all

        format.html { redirect_to @input, notice: 'Input was successfully updated.' }
        format.json { render :show, status: :ok, location: @input }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @input.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @input = Input.find(params[:input_id])
  end


  # DELETE /inputs/1
  # DELETE /inputs/1.json
  def destroy
    @input.destroy
    @inputs = Input.all

    respond_to do |format|
      format.html { redirect_to inputs_url, notice: 'Input was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input
      @input = Input.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_params
      params.require(:input).permit(:input_type_id, :name,  
       :manufacture_date,
      :expiration_date, :batch_number,:cip, :manufacturer, :alert_level, :shelf_number, :provider_id
      )
    end
end

