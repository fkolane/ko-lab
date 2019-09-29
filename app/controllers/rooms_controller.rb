class RoomsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @services = Service.all
  end

  # GET /rooms/1/edit
  def edit
    @services = Service.all
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = current_user.rooms.build(room_params)

    respond_to do |format|
      if @room.save
        @rooms = Room.all
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
        format.js
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        @rooms = Room.all
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @room = Room.find(params[:room_id])
  end
  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    @rooms = Room.all
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :capacity, :service_id)
    end
end
