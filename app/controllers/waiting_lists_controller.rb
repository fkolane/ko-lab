class WaitingListsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_waiting_list, only: [:show, :edit, :update, :destroy]

  # GET /waiting_lists
  # GET /waiting_lists.json
  def index
    @waiting_lists = WaitingList.where(status: "Ouvert(e)")
  end

  # GET /waiting_lists/1
  # GET /waiting_lists/1.json
  def show
  end

  # GET /waiting_lists/new
  def new
    @waiting_list = WaitingList.new
  end

  # GET /waiting_lists/1/edit
  def edit
  end

  # POST /waiting_lists
  # POST /waiting_lists.json
  def create
    @waiting_list = WaitingList.new(waiting_list_params)

    respond_to do |format|
      if @waiting_list.save
        format.html { redirect_to @waiting_list, notice: 'Waiting list was successfully created.' }
        format.json { render :show, status: :created, location: @waiting_list }
      else
        format.html { render :new }
        format.json { render json: @waiting_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waiting_lists/1
  # PATCH/PUT /waiting_lists/1.json
  def update
    respond_to do |format|
      if @waiting_list.update(waiting_list_params)
        @waiting_lists = WaitingList.where(status: "Ouvert(e)")

        format.html { redirect_to @waiting_list, notice: 'Waiting list was successfully updated.' }
        format.json { render :show, status: :ok, location: @waiting_list }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @waiting_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /waiting_lists/1
  # DELETE /waiting_lists/1.json
  def destroy
    @waiting_list.destroy
    respond_to do |format|
      format.html { redirect_to waiting_lists_url, notice: 'Waiting list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiting_list
      @waiting_list = WaitingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiting_list_params
      params.require(:waiting_list).permit(:patient_id, :analysis_id, :receipt_id,  :status)
    end
end
