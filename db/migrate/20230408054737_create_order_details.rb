class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :product_id,        null: false,  foreign_key: true
      t.integer :order_id,          null: false,  foreign_key: true
      t.integer :product_quantity,  null: false
      t.integer :tax_included,      null: false
      t.integer :production_status, null: false,  default: 1

      t.timestamps  null: false
    end
  end
end
