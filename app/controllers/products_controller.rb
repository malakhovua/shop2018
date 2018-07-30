class ProductsController < ApplicationController
   before_action :set_product, only: [:show, :edit, :update, :destroy]
  #skip_before_action :before_some_method, except: [:index]
  skip_before_action  :authenticate_user!


  def index
    #@per_page = params[:per_page].present? ? params[:per_page].to_i : 5
    @page = params[:page].present? ? params[:page].to_i : 1

    @products = Product.page(@page)
  end

  def show

  end

  def new
    @product = Product.new
  end

  def edit

  end

  def update
    @product.update(product_params)
    redirect_to @product
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

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:id,:file,:_destroy])
  end

end
