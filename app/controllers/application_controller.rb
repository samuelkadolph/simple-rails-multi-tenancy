class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    @tenant = Tenant.current = Tenant.find_by_host(request.host)
    render 'shared/no_such_tenant' unless @tenant
  end
end
