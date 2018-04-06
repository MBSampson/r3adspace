class PurchaseMailer < ApplicationMailer

  def new_purchase(ad, order)
    @ad = ad
    @order = order
    mail to: ad.user.email
  end

  def shipped_order(sale)
    @sale = sale

    mail to: "mbsampson89@gmail.com"
  end
end
