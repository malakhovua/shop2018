class ApplicationController < ActionController::Base
  include CurrentCart
  include SessionsHelper
  before_action :set_cart
  before_action :set_locale
  before_action  :authorize

  def default_url_options
     {locale: I18n.locale}
  end


  # before_action  :authenticate_user
   # before_action :authenticate_user!
  # before_action :before_some_method
  # after_action  :after_some_method
  # around_action :around_some_method

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  private

  def set_locale
     I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = params[:locale]
  end

  def authenticate_user
    # authenticate_user!
  end

  def before_some_method
    puts 'before_action => some_method'
  end

  def after_some_method
    puts 'after_action => some_method'
  end

  def around_some_method
    puts 'around_action => some_method'
  end

end
