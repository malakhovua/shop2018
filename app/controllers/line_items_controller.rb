class LineItemsController < ApplicationController

  include CurrentCart
  skip_before_action :authorize, only: [:create, :destroy]
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  def remove_item

    product = Product.find(params[:product_id])
    @line_item = @cart.remove_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end

  end

  # POST /line_items
  # POST /line_items.json
  def create

    product = Product.find(params[:product_id])
    
    if params[:remove] then
       @line_item = @cart.remove_product(product)
    elsif params[:delete] then 
      @line_item = @cart.delete_product(product)
    else
      @line_item = @cart.add_product(product)
    end
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to line_item_url}
        # format.html { redirect_to @line_item.cart}
        format.js
        format.json { render :show,
        status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    update_cart_show
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
       
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      if @line_item.destroy
        format.html { redirect_to line_item_url}
        # format.html { redirect_to @line_item.cart}
        format.js
        format.json { render :show,
                             status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end

    def update_cart_show


      @carts = Cart.all
      ActionCable.server.broadcast 'carts',
      html: render_to_string('carts/show', layout: false)

    end



end
