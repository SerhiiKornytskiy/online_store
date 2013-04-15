class OrdersController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy, :index] 
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def new
  @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_path, notice: "Cart is empty"
      return
    end
    @order = Order.new
    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end


  def edit
    @order = Order.find(params[:id])
  end


  def create
    @cart = current_cart
    @order = Order.new(params[:order])
    @order.add_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to store_url, notice: 'Order was successfully created.' }
        format.json { render json: store_url, status: :created, location: @order }
        format.js
      else
        @cart = current_cart
        format.html { redirect_to store_url, notice: 'Fill in all the information!' }
        format.js
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
