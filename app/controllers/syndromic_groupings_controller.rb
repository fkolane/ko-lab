class SyndromicGroupingsController < ApplicationController
  before_action :set_syndromic_grouping, only: [:show, :edit, :update, :destroy]

  # GET /syndromic_groupings
  # GET /syndromic_groupings.json
  def index
    @syndromic_groupings = SyndromicGrouping.all
  end

  # GET /syndromic_groupings/1
  # GET /syndromic_groupings/1.json
  def show
  end

  # GET /syndromic_groupings/new
  def new
    @syndromic_grouping = SyndromicGrouping.new
  end

  # GET /syndromic_groupings/1/edit
  def edit
  end

  # POST /syndromic_groupings
  # POST /syndromic_groupings.json
  def create
    @syndromic_grouping = SyndromicGrouping.new(syndromic_grouping_params)

    respond_to do |format|
      if @syndromic_grouping.save
        format.html { redirect_to @syndromic_grouping, notice: 'Syndromic grouping was successfully created.' }
        format.json { render :show, status: :created, location: @syndromic_grouping }
      else
        format.html { render :new }
        format.json { render json: @syndromic_grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syndromic_groupings/1
  # PATCH/PUT /syndromic_groupings/1.json
  def update
    respond_to do |format|
      if @syndromic_grouping.update(syndromic_grouping_params)
        format.html { redirect_to @syndromic_grouping, notice: 'Syndromic grouping was successfully updated.' }
        format.json { render :show, status: :ok, location: @syndromic_grouping }
      else
        format.html { render :edit }
        format.json { render json: @syndromic_grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndromic_groupings/1
  # DELETE /syndromic_groupings/1.json
  def destroy
    @syndromic_grouping.destroy
    respond_to do |format|
      format.html { redirect_to syndromic_groupings_url, notice: 'Syndromic grouping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syndromic_grouping
      @syndromic_grouping = SyndromicGrouping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syndromic_grouping_params
      params.require(:syndromic_grouping).permit(:syndromic_grouping, :consultation_id, :status)
    end
end
