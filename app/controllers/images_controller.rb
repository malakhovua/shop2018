class ImagesController < ApplicationController

  include Productable

  def new
    @image = @product.images.new
  end

  def create
   @product.images.create(image_params)
    redirect_to @product
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end

end
