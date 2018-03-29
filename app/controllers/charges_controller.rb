class ChargesController < ApplicationController
  before_action :set_current_user, only: [:new, :create]
  before_action :set_ad, only: [:new]

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    ad = Ad.find(params[:ad_id])
    # Amount in cents
    @amount = (ad.price.to_f * 100).to_i


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

    ad.sold = true
    ad.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def set_ad
      @ad = Ad.find(params[:ad_id])
    end

    def set_current_user
      @user = current_user
    end

end
