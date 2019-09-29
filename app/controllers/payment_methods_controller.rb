class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_payment_method, only: [:show, :edit, :update, :destroy]

  # GET /payment_methods
  # GET /payment_methods.json
  def index
    @payment_methods = PaymentMethod.all
  end

  # GET /payment_methods/1
  # GET /payment_methods/1.json
  def show
  end

  # GET /payment_methods/new
  def new
    @payment_method = PaymentMethod.new
  end

  # GET /payment_methods/1/edit
  def edit
  end

  # POST /payment_methods
  # POST /payment_methods.json
  def create
    @payment_method = current_user.payment_methods.build(payment_method_params)

    respond_to do |format|
      if @payment_method.save
        @payment_methods = PaymentMethod.all
        format.html { redirect_to @payment_method, notice: 'Payment method was successfully created.' }
        format.json { render :show, status: :created, location: @payment_method }
        format.js
      else
        format.html { render :new }
        format.json { render json: @payment_method.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /payment_methods/1
  # PATCH/PUT /payment_methods/1.json
  def update
    respond_to do |format|
      if @payment_method.update(payment_method_params)
        @payment_methods = PaymentMethod.all
        format.html { redirect_to @payment_method, notice: 'Payment method was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_method }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @payment_method.errors, status: :unprocessable_entity }
        fomat.js
      end
    end
  end


  def delete
    @payment_method = PaymentMethod.find(params[:payment_method_id])
  end


  # DELETE /payment_methods/1
  # DELETE /payment_methods/1.json
  def destroy
    @payment_method.destroy
    respond_to do |format|
      format.html { redirect_to payment_methods_url, notice: 'Payment method was successfully destroyed.' }
      format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_method
      @payment_method = PaymentMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_method_params
      params.require(:payment_method).permit(:name, :description)
    end
end
