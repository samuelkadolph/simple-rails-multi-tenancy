class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :with_tenant

  protected
    def with_tenant
      Tenant.find_by_host!(request.host).with { yield }
    end
end
