module ApplicationHelper
  def select_shopping_cart
    if current_user.shopping_carts.where(status: 'pendente').empty?
      shopping_cart = ShoppingCart.new(status: 'pendente')
      shopping_cart.user = current_user
      shopping_cart.save!
    else
      shopping_cart = current_user.shopping_carts.where(status: 'pendente').last
    end
    shopping_cart
  end
end
