class ProductsController < ApplicationController

  skip_before_action :before_some_method, except: [:index]

  def index
    puts 'ProductsController => index'
    @products = Product.all
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
