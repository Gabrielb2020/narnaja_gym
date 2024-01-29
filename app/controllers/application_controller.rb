class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Verify that policies are used for all actions in controllers
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index
end
