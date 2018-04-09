class SalesController < ApplicationController
  before_action :set_sale, only: [:edit, :ship_order, :update, :destroy]
  before_action :set_user, only: [:new, :index, :ship_order]
  before_action :authenticate_user!

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.page(params[:page]).per(6).where(user_id: params[:user_id]).order(id: :desc)

    if current_user.id != params[:user_id].to_i
      flash[:notice] = "You do not have access to this page."
      redirect_to ads_url
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  def ship_order
    # Production
    # @sale.update!(shipped: true)
    # flash[:notice] = "Your sale is now marked as shipped!"
    # redirect_to sales_url

    # Development method
    if @sale.shipped
      flash[:notice] = "SHIPPED TOGGLED"
      @sale.update!(shipped: false)
      redirect_to sales_url(:user_id => @user.id)
    else
      flash[:notice] = "Your sale is now marked as shipped!"
      @sale.update!(shipped: true)
      PurchaseMailer.shipped_order(@sale).deliver_now
      redirect_to sales_url(:user_id => @user.id)
    end
    # end development method
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.fetch(:sale, {})
    end
end
