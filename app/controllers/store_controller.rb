class StoreController < ApplicationController
  def index
    @products = Product.order(:title).page params[:page]
    @cart = current_cart
  end
end
