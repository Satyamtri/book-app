class Lineitem < ApplicationRecord
    belongs_to :order
    belongs_to :book

    # def total_price
    #     self.quantity * self.book.price
    # end
end
