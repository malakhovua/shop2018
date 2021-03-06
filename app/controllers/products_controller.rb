class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #skip_before_action :before_some_method, except: [:index]
  # skip_before_action  :authenticate_user!

  skip_before_action :authorize

  def index


    @page = params[:page].present? ? params[:page].to_i : 1

    @products = if params[:Product_name]
                  Product.page(@page).where('name LIKE ?', "%#{params[:Product_name]}%")
                else
                  Product.page(@page)
                end
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def update
    # @product.update(product_params)
    # redirect_to @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { 
          redirect_to @product,
        notice: 'Product was successfully updated.' }
      format.json { render :show, status: :ok, location: @product }
     
      @products = Product.all
      ActionCable.server.broadcast 'products',
      html: render_to_string('products/index', layout: false)

      @carts = Cart.all
      ActionCable.server.broadcast 'carts',
      html: render_to_string('carts/show', layout: false)

      else
        format.html { render :edit }
      format.json { 
        render json: @product.errors,
      status: :unprocessable_entity }
      end
    end
  end

  def create
    Product.create(product_params)

    redirect_to products_path
    
  end

  def destroy
    @product.destroy

    if request.xhr?
      head :no_content
    else
      redirect_to products_path
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, images_attributes: [:id,:file,:_destroy])
  end

end
