class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :new, :edit, :update, :destroy ]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @ad = Ad.find(params[:ad_id])

    @quantity_arr = []
    i = 1

    while i <= @ad.quantity do
      @quantity_arr.push(i)
      i += 1
    end
  end

  # GET /orders/1/edit
  def edit
    @ad = Ad.find(params[:ad_id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @ad = Ad.find(params[:ad_id])

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_charge_path(:ad_id => @ad.id, :order_id => @order.id), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    ad = Ad.find(params[:ad_id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to new_charge_path(:ad_id => ad.id, :order_id => @order.id), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :state, :zipcode, :city, :user_id, :item_quantity, :buyer_last_name, :buyer_first_name)
    end
end
