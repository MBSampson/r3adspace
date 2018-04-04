class ChargesController < ApplicationController
  before_action :set_current_user, only: [:new, :create]
  before_action :set_ad, only: [:new, :create]
  before_action :set_order, only: [:new, :create]

  def new
  end

  def create
    # Amount in cents
    @amount = ((@ad.price.to_f * 100) * @order.item_quantity.to_f).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @ad.quantity -= @order.item_quantity
    if @ad.quantity <= 0
      @ad.sold = true
    end
    @ad.save

    @order.completed = true
    @order.cost = @amount
    @order.save

    generate_sale_data

    PurchaseMailer.new_purchase(@ad, @order).deliver_now

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def set_ad
      @ad = Ad.find(params[:ad_id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_current_user
      @user = current_user
    end

    def generate_sale_data
      # Create Sale entry for the order
      sale_hash = {
        :buyer_first_name => @order.buyer_first_name,
        :buyer_last_name => @order.buyer_last_name,
        :ad_title => @ad.title,
        :total_amount => (@ad.price.to_f * @order.item_quantity.to_f),
        :item_quantity => @order.item_quantity,
        :shipping_street => @order.address,
        :shipping_city => @order.city,
        :shipping_state => @order.state,
        :shipping_zipcode => @order.zipcode,
        :user_id => @user.id
      }
      @sale = Sale.new(sale_hash)
      @sale.save
    end

end
