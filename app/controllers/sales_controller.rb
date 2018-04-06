class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :ship_order, :update, :destroy]
  before_action :set_user, only: [:new, :index, :show]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
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
      redirect_to sales_url
    else
      flash[:notice] = "Your sale is now marked as shipped!"
      @sale.update!(shipped: true)
      redirect_to sales_url
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
