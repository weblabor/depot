class StoreController < ApplicationController
  
  def index
    @products = Product.find_products_for_sale
  end
  
  def add_to_cart
    # Diese Variable product ist unabhängig von der id-Bezeichung von button_to aus index.html 
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
  end
  
private

  def find_cart
    session[:cart] ||= Cart.new
  end
end
