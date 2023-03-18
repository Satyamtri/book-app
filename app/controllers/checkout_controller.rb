class CheckoutController < ApplicationController

    def create
        # order = Order.find(params[:id])
        book = Book.find(params[:id])
        @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
            quantity: 1,
            price_data: {
                currency: "inr",
                unit_amount:  book.price.to_i * 100,
                product_data: {
                    name: book.bname,
                },
            }
        }],
        mode: 'payment',
        success_url: "http://localhost:3000/books",
        cancel_url: "http://localhost:3000/books",
       })
       respond_to do |format|
        format.js
       end
    end

end