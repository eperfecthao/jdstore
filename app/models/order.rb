class Order < ApplicationRecord

  belongs_to :user
  has_many :product_lists

  validates_presence_of :billing_name
  validates_presence_of :billing_address
  validates_presence_of :shipping_name
  validates_presence_of :shipping_address

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_method!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
