class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    render file: Rails.root.join('/public/403.html'), status: :forbidden
  end
end
