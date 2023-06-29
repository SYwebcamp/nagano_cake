class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,         null: false, foreign_key: true
      t.string :shipping_address,     null: false
      t.string :shipping_name,        null: false
      t.string :shipping_postal_code, null: false
      t.integer :amount_paid,         null: false
      t.integer :payment_method,      null: false
      t.integer :postage,             null: false
      t.integer :status,              null: false,  default: 1

      t.timestamps  null: false
    end
  end
end
