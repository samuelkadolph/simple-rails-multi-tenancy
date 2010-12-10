class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :tenant
      t.string     :name
      t.text       :description
      t.integer    :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
