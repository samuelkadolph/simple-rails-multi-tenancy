class Tenant < ActiveRecord::Base
  class << self
    def current
      Thread.current[:current_tenant]
    end

    def current=(tenant)
      Thread.current[:current_tenant] = tenant
    end
  end

  validates :name, :host, :presence => true
end
