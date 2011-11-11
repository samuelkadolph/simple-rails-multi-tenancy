class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :tenant

      t.string :name
      t.text :description
      t.integer :quantity

      t.timestamps
    end

    add_index :products, :tenant_id
  end
end
