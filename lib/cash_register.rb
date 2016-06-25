
require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(name, price, quantity=1)
    self.last_price = self.total
    self.total += price * quantity
    quantity.times {self.items << name}
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0

    self.total = self.total * (100 - self.discount) / 100
    return "After the discount, the total comes to $#{self.total}."
  end

  def void_last_transaction
    self.total = self.last_price
  end
end
