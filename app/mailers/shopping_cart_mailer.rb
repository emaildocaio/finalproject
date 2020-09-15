class ShoppingCartMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shopping_cart_mailer.payment_confirmation.subject
  #
  def payment_confirmation
    @shopping_cart= params[:shopping_cart]

    mail(to: @shopping_cart.user.email, subject: 'Payment Confirmation - Visite Arraial do Cabo')
  end
end
