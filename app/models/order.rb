class Order < ApplicationRecord

  belongs_to :user
  has_many :product_lists

  validates_presence_of :billing_name
  validates_presence_of :billing_address
  validates_presence_of :shipping_name
  validates_presence_of :shipping_address
end
