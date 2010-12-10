class CreateTenants < ActiveRecord::Migration
  def self.up
    create_table :tenants do |t|
      t.string     :name
      t.string     :host
      t.timestamps
    end

    add_index :tenants, :host
  end

  def self.down
    drop_table :tenants
  end
end
