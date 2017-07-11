class Order < ApplicationRecord

  belongs_to :user
  has_many :product_lists

  validates_presence_of :billing_name
  validates_presence_of :billing_address
  validates_presence_of :shipping_name
  validates_presence_of :shipping_address

  before_create :generate_token

  include AASM

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_method!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :deliver do
      transitions from: :shipping, to: :shipped
    end

    event :return_good do
      transitions from: :shipped, to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end
end
