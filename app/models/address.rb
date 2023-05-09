class Address < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
end
