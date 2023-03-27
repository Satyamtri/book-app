class Order < ApplicationRecord
    
    CART = 0
    ADDRESS = 1
    PAYMENT = 2
    COMPLETE = 3
    
    enum state: {cart: CART, address: ADDRESS, payment: PAYMENT, complete: COMPLETE}
    
    has_many :lineitems, dependent: :destroy
    belongs_to :user
    belongs_to :address, optional: true
    # has_many :addresses
    
end
