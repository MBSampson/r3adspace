class PurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.new_purchase.subject
  #
  def new_purchase(ad, order)
    # mail to: ad.user.email
    @ad = ad
    @order = order
    mail to: ad.user.email
  end

  def shipped_order()


  end
end
