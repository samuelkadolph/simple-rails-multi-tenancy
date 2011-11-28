class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :with_tenant

  protected
    attr_reader :current_tenant

    def with_tenant
      @current_tenant = Tenant.find_by_host!(request.host)
      @current_tenant.with { yield }
    end
end
