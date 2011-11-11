class TenantScopedModel < ActiveRecord::Base
  class << self
    def build_default_scope
      if method(:default_scope).owner != ActiveRecord::Base.singleton_class
        evaluate_default_scope { default_scope }
      elsif default_scopes.any?
        evaluate_default_scope do
          default_scopes.inject(relation) do |default_scope, scope|
            if scope.is_a?(Hash)
              default_scope.apply_finder_options(scope)
            elsif !scope.is_a?(ActiveRecord::Relation) && scope.respond_to?(:call)
              if scope.respond_to?(:arity) && scope.arity == 1
                scope = scope.call(self)
              else
                scope = scope.call
              end
              default_scope.merge(scope)
            else
              default_scope.merge(scope)
            end
          end
        end
      end
    end
  end

  self.abstract_class = true

  belongs_to :tenant

  default_scope do |model|
    model.where(:tenant_id => Tenant.current)
  end
end
