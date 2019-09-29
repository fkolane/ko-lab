class InsuredListsController < ApplicationController
  before_action :set_insured_list, only: [:show, :edit, :update, :destroy]

  # GET /insured_lists
  # GET /insured_lists.json
  def index
    @insured_lists = InsuredList.all
  end

  # GET /insured_lists/1
  # GET /insured_lists/1.json
  def show
  end

  # GET /insured_lists/new
  def new
    @insured_list = InsuredList.new
  end

  # GET /insured_lists/1/edit
  def edit
  end

  # POST /insured_lists
  # POST /insured_lists.json
  def create
    @insured_list = InsuredList.new(insured_list_params)

    respond_to do |format|
      if @insured_list.save
        format.html { redirect_to @insured_list, notice: 'Insured list was successfully created.' }
        format.json { render :show, status: :created, location: @insured_list }
      else
        format.html { render :new }
        format.json { render json: @insured_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insured_lists/1
  # PATCH/PUT /insured_lists/1.json
  def update
    respond_to do |format|
      if @insured_list.update(insured_list_params)
        format.html { redirect_to @insured_list, notice: 'Insured list was successfully updated.' }
        format.json { render :show, status: :ok, location: @insured_list }
      else
        format.html { render :edit }
        format.json { render json: @insured_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insured_lists/1
  # DELETE /insured_lists/1.json
  def destroy
    @insured_list.destroy
    respond_to do |format|
      format.html { redirect_to insured_lists_url, notice: 'Insured list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insured_list
      @insured_list = InsuredList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insured_list_params
      params.require(:insured_list).permit(:identifier, :first_name, :last_name, :sex, :born_date, :born_placestar_date, :end_date, :status, :user_id)
    end
end
