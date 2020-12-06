class ApplicationController < ActionController::Base
  after_action :verify_authorized

  include EnjuLibrary::Controller
  include EnjuBiblio::Controller
  include Pundit
end
