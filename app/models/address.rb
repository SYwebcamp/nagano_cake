class Address < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'

  def address_display
    '〒' + postal_code + "" + address + "" + name
  end
end
