module EnjuIr
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Pundit
    after_action :verify_authorized
  end
end
