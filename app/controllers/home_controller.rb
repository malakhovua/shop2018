class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index

  end
end
