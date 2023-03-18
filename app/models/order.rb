class Order < ApplicationRecord
    
    CART = 0
    ADDRESS = 1
    PAYMENT = 2
    
    enum state: {cart: CART, address: ADDRESS, payment: PAYMENT}
    
    has_many :lineitems, dependent: :destroy
    belongs_to :user
    belongs_to :address
    # has_many :addresses
    
    
    private

    def set_subtotal
        self[:subtotal] = subtotal
    end
end
