class CheckoutController < ApplicationController

    def create
        @order = Order.find(params[:id])
        @line_items = @order.lineitems 
        @order.update(state: 2, address_id: params[:address].to_i)
        books_name =[]
        @line_items.each do |x|
            books_name << x.book.bname 
        end   
        total_amount = @line_items.pluck(:total_price).compact.sum 
        @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
            quantity: 1,
            price_data: {
                currency: "inr",
                unit_amount:  total_amount * 100,
                product_data: {
                    name: books_name.to_s,
                },
            }
        }],
        mode: 'payment',
        success_url: checkout_success_url(total_amount: total_amount),
        cancel_url: checkout_cancel_url,
       })
       respond_to do |format|
        format.js
       end
    end
    
    def success
        @total_amount=params[:total_amount].to_i
        @user = current_user
        @order = @user.orders.last
        OrderMailer.order_created(current_user,@total_amount,@order).deliver_now
    end

end