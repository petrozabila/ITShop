class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_create :set_const_price
  before_save :update_subtotal_price

  validates :product_id, :const_price, :number,
            presence: true
  validates :number,
            numericality: {greater_than_or_equal_to: 1}

  private

  def set_const_price
    self.const_price = product.price
  end

  def update_subtotal_price
    self.subtotal_price = const_price * number
  end
end