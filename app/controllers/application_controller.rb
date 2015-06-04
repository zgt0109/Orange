class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :main_layout

  private
    def main_layout
      if ['/enterprises/sign_in'].include?( request.path )
        false
      elsif params[:controller] =~ /^enterprise/
        'enterprise'
      else
        'application'
      end
    end
end
