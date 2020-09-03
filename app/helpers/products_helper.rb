module ProductsHelper
  def product_user_check(product)
    return false if current_user.nil?

    product.company == current_user.company
  end
end
