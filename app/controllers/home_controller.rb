class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to home_index_path(locale: params[:set_locale])
    else
      
    end

  end
end
