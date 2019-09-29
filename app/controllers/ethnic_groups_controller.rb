class EthnicGroupsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_ethnic_group, only: [:show, :edit, :update, :destroy]

  # GET /ethnic_groups
  # GET /ethnic_groups.json
  def index
    @ethnic_groups = EthnicGroup.all
  end

  # GET /ethnic_groups/1
  # GET /ethnic_groups/1.json
  def show
  end

  # GET /ethnic_groups/new
  def new
    @ethnic_group = EthnicGroup.new
  end

  # GET /ethnic_groups/1/edit
  def edit
  end

  # POST /ethnic_groups
  # POST /ethnic_groups.json
  def create
    @ethnic_group = current_user.ethnic_groups.build(ethnic_group_params)

    respond_to do |format|
      if @ethnic_group.save
        @ethnic_groups = EthnicGroup.all

        format.html { redirect_to @ethnic_group, notice: 'Ethnic group was successfully created.' }
        format.json { render :show, status: :created, location: @ethnic_group }
        format.js
      else
        format.html { render :new }
        format.json { render json: @ethnic_group.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /ethnic_groups/1
  # PATCH/PUT /ethnic_groups/1.json
  def update
    respond_to do |format|
      if @ethnic_group.update(ethnic_group_params)
        @ethnic_groups = EthnicGroup.all

        format.html { redirect_to @ethnic_group, notice: 'Ethnic group was successfully updated.' }
        format.json { render :show, status: :ok, location: @ethnic_group }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @ethnic_group.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @ethnic_group = EthnicGroup.find(params[:ethnic_group_id])
  end

  # DELETE /ethnic_groups/1
  # DELETE /ethnic_groups/1.json
  def destroy
    @ethnic_group.destroy
    @ethnic_groups = EthnicGroup.all

    respond_to do |format|
      format.html { redirect_to ethnic_groups_url, notice: 'Ethnic group was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ethnic_group
      @ethnic_group = EthnicGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ethnic_group_params
      params.require(:ethnic_group).permit(:name, :description)
    end
end
