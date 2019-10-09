class InputTypesController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_input_type, only: [:show, :edit, :update, :destroy]

  # GET /input_types
  # GET /input_types.json
  def index
    @input_types = InputType.all
  end

  # GET /input_types/1
  # GET /input_types/1.json
  def show
  end

  # GET /input_types/new
  def new
    @input_type = InputType.new
  end

  # GET /input_types/1/edit
  def edit
  end

  # POST /input_types
  # POST /input_types.json
  def create
    @input_type = current_user.input_types.build(input_type_params)

    respond_to do |format|
      if @input_type.save
        @input_types = InputType.all

        format.html { redirect_to @input_type, notice: 'Input type was successfully created.' }
        format.json { render :show, status: :created, location: @input_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @input_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /input_types/1
  # PATCH/PUT /input_types/1.json
  def update
    respond_to do |format|
      if @input_type.update(input_type_params)
        @input_types = InputType.all

        format.html { redirect_to @input_type, notice: 'Input type was successfully updated.' }
        format.json { render :show, status: :ok, location: @input_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @input_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @input_type = InputType.find(params[:input_type_id])
  end

  # DELETE /input_types/1
  # DELETE /input_types/1.json
  def destroy
    @input_type.destroy
    @input_types = InputType.all

    respond_to do |format|
      format.html { redirect_to input_types_url, notice: 'Input type was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_type
      @input_type = InputType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_type_params
      params.require(:input_type).permit(:name, :description)
    end
end
