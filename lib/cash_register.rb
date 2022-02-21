require 'pry'

class CashRegister
    attr_reader :add_item, :items
    attr_accessor :discount, :total, :last_item_price
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item title, price, quantity = 1
        @last_item_price = price * quantity
        @total += price * quantity
        quantity.times do
            @items = @items.append(title)
        end
    end

    def apply_discount
        @total -= total * discount / 100
        if discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total -= @last_item_price
    end

end

# ex = CashRegister.new(20)
# ex.add_item("macbook air", 1000)
# ex.add_item("something", 20)
# ex.items
# binding.pry