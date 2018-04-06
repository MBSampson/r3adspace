class PurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.new_purchase.subject
  #
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
