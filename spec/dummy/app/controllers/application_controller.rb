class ApplicationController < ActionController::Base
  after_action :verify_authorized

  include Pundit
end
