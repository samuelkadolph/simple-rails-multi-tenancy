class Tenant < ActiveRecord::Base
  class << self
    def current
      Thread.current[:tenant]
    end

    def current=(tenant)
      Thread.current[:tenant] = tenant
    end
  end

  validates :name, :host, :presence => true

  def with
    previous, Tenant.current = Tenant.current, self
    yield
  ensure
    Tenant.current = previous
  end
end
