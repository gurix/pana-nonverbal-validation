require 'application_responder'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  self.responder = ApplicationResponder

  def http_basic_auth
    return if Rails.application.secrets.export_password.blank?
    authenticate_or_request_with_http_basic do |_username, password|
      password == Rails.application.secrets.export_password
    end
  end
end
