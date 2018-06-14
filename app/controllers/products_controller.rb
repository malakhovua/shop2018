class ProductsController < ApplicationController

  skip_before_action :before_some_method, except: [:index]

  def index
    #@per_page = params[:per_page].present? ? params[:per_page].to_i : 5
    @page = params[:page].present? ? params[:page].to_i : 1

    @products = Product.page(@page)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.price = params[:product][:price]
    @product.name  = params[:product][:name]
    @product.save


    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    if request.xhr?
      head :no_content
    else
      redirect_to products_path
    end
  end
end
