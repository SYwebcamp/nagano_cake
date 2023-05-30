class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: 'order_id'
  belongs_to :item, foreign_key: 'product_id'
  enum production_status: { production_not_possible: 0, production_pending: 1, in_production: 2, in_production_complete: 3 }
  def subtotal
    product_quantity * tax_included
  end
end
