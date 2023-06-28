class Order < ApplicationRecord
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 1, payment_confirmation: 2, in_production: 3, preparing_delivery: 4, delivered: 5 }
  belongs_to :customer, foreign_key: 'customer_id'
  def shipping_fee
    800
  end
  def product_total
    amount_paid - shipping_fee
  end
  def shipping_address_display
    "〒" + shipping_postal_code + shipping_address
  end

end
