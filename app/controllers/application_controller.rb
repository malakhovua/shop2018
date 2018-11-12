class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action  :authorize
  # before_action  :authenticate_user
   # before_action :authenticate_user!
  # before_action :before_some_method
  # after_action  :after_some_method
  # around_action :around_some_method
  #
  protected
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translashion not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end



   private

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
