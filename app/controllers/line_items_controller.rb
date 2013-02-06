class LineItemsController < ApplicationController
  
  before_filter :find_line_item, :only => [:show, :destroy, :update]

  def find_line_item
    @line_item = LineItem.find(params[:id])
  end  

  def index
    @line_items = LineItem.all


  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
 

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    
    respond_to do |format|
      format.js { @current_item = @line_item } if @line_item.save
    end

  end

  def update
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    
    @line_item.destroy
  
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js
    end

  end

end
