# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include FaceboxRender
  include Magick
  helper :all 
  protect_from_forgery 

  helper_method :current_user, :current_user_session, :current_movie, :current_user_session, :iphone_user_agent?
  #filter_parameter_logging :password,:password_confirmation
  
  before_filter :adjust_format_for_iphone

  before_filter :set_locale 
  def set_locale # if params[:locale] is nil then I18n.default_locale will be used  
  I18n.locale = params[:locale] 
  
  end
  
  def extract_locale_from_tld
   parsed_locale = request.host.split('.').last (available_locales.include?parsed_locale) ? parsed_locale : nil 
  end 
  
  def render_401
    render "/errors/error_401"
  end

  def render_404
    render "/errors/error_404"
  end

  def render_500
    render "/errors/error_500"
  end

  def render_error(status)
    begin
     render "errors/error_#{status}"
    rescue
     render Rails.root.join("public","404.html")
    end
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
   
  def require_user
    unless current_user
      store_location
      redirect_to login_url
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to root_url
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default = '/')
    redirect_to( session[:return_to] || default )
    session[:return_to] = nil
  end
 
 private
   def adjust_format_for_iphone
      if request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod)/]
        request.format = :iphone
      end
   end

end


  
