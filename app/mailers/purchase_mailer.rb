class PurchaseMailer < ApplicationMailer

  def new_purchase(ad, order)
    @ad = ad
    @order = order
    mail to: ad.user.email
  end

  def shipped_order(sale)
    @sale = sale
    # production
    # mail to: sale.buyer_email

    # dev test
    mail to: "mbsampson89@gmail.com"
  end
end
