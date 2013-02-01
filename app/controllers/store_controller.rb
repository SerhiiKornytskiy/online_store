class StoreController < ApplicationController
  def index
    @products = Product.select([:title, :image_url, :description, :price, :id])
    @cart = current_cart
  end
end
