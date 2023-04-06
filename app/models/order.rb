class Order < ApplicationRecord
    
    CART = 0
    ADDRESS = 1
    COMPLETE = 2
    
    enum state: {cart: CART, address: ADDRESS, complete: COMPLETE}
    
    has_many :lineitems, dependent: :destroy
    belongs_to :user
    
    belongs_to :address, optional: true
end
