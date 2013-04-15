class ProductsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update]
  before_filter :find, :only => [:show, :edit, :destroy, :update]

  def find
    @product = Product.find(params[:id])
  end
    
  def index
    @products = Product.order(:title).page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end


  def show
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def category
    @selected = Product.find_all_by_category(params[:category])
    @products = Kaminari.paginate_array(@selected).page(params[:page])
    render action: "index"
  end  

end
