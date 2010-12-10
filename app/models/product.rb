class Product < TenantScopedModel
  validates :name, :description, :quantity, :presence => true
end
