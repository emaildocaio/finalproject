class ShoppingCartMailerPreview < ActionMailer::Preview
  def payment_confirmation
    ShoppingCartMailer.with(shopping_cart: ShoppingCart.first).payment_confirmation
  end
end