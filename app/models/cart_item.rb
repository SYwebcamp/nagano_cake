class CartItem < ApplicationRecord
  belongs_to :item, foreign_key: 'item_id'
  belongs_to :customer, foreign_key: 'customer_id'

  def subtotal
    item.add_tax_price * amount
  end

  def already
     current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  end
  validates :amount, presence: true

end