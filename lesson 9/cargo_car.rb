require_relative('car')

class CargoCar < Car
  attr_reader :filled_amount

  def initialize(amount)
    @amount = amount
    @filled_amount = 0
  end

  def fill_amount(size)
    @filled_amount += size
  end

  def available_amount
    @amount - @filled_amount
  end
end