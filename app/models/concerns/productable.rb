module Productable
  extend ActiveSupport::Concern

  included do
    before_action :set_product
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end