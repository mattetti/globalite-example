# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  around_filter :set_locale

  private
  def set_locale
    @current_path = request.env['PATH_INFO']
    @request_method = request.env['REQUEST_METHOD']
    if params[:user_locale] && params[:user_locale][:code]
      Locale.code = params[:user_locale][:code] 
      # Store the locale in the session 
      session[:locale] = params[:user_locale][:code]
    elsif session[:locale]
      Locale.code = session[:locale]
    end
    flash[:message] = "User locale set to #{Locale.code}"
    # render the page
    yield  
    # reset the locale to its default value
    Locale.reset!
  end

end
