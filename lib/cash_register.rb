require 'pry'

class CashRegister
   
    attr_accessor :discount, :total, :items, :transactions

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @items = []
        @transactions = []
    end

    def add_item(item, price, quantity = 1)
        Array.new(quantity, item).map{|string| @items << string}
        transaction = { item: item, price: price, quantity: quantity }
        @transactions << transaction
        @total += price * quantity
    end

    def apply_discount
        if discount
            @total = @total - (@total * discount/100)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - @transactions[-1][:price]
        @transactions.pop
        if @transactions.length == 0
            self.total = 0
        else
        end
    end
end
john = CashRegister.new(0)
binding.pry