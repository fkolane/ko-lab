class ResultItemsController < ApplicationController
  before_action :set_result_item, only: [:show, :edit, :update, :destroy]

  # GET /result_items
  # GET /result_items.json
  def index
    @result_items = ResultItem.all
  end

  # GET /result_items/1
  # GET /result_items/1.json
  def show
  end

  # GET /result_items/new
  def new
    @result_item = ResultItem.new
  end

  # GET /result_items/1/edit
  def edit
  end

  # POST /result_items
  # POST /result_items.json
  def create
    @result_item = ResultItem.new(result_item_params)

    respond_to do |format|
      if @result_item.save
        format.html { redirect_to @result_item, notice: 'Result item was successfully created.' }
        format.json { render :show, status: :created, location: @result_item }
      else
        format.html { render :new }
        format.json { render json: @result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_items/1
  # PATCH/PUT /result_items/1.json
  def update
    respond_to do |format|
      if @result_item.update(result_item_params)
        format.html { redirect_to @result_item, notice: 'Result item was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_item }
      else
        format.html { render :edit }
        format.json { render json: @result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_items/1
  # DELETE /result_items/1.json
  def destroy
    @result_item.destroy
    respond_to do |format|
      format.html { redirect_to result_items_url, notice: 'Result item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_item
      @result_item = ResultItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_item_params
      params.fetch(:result_item, {})
    end
end
