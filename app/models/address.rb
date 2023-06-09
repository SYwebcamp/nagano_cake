class Address < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'

  def address_display
    '〒' + postal_code + "" + address + "" + name
  end
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
