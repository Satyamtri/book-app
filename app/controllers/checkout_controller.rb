class CheckoutController < ApplicationController

    def create
        @order = Order.find(params[:id])
        # session[:current_order_id]=@order
        @line_items = @order.lineitems 
        @order.update(state: 3)
        books_name =[]
        @line_items.each do |x|
            books_name << x.book.bname 
        end 
            
        total_amount = @line_items.pluck(:price).compact.sum 
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
        success_url: checkout_success_url(books: books_name),
        cancel_url: checkout_cancel_url,
       })
       respond_to do |format|
        format.js
       end
    end
    
    def success
        @user = current_user
        @x=params[:books]
        OrderMailer.order_created(current_user).deliver_now
    end

    def cancel

    end

     # def create_book
    #     book = Book.find(params[:id])
    #     @session = Stripe::Checkout::Session.create({
    #     payment_method_types: ['card'],
    #     line_items: [{
    #         quantity: 1,
    #         price_data: {
    #             currency: "inr",
    #             unit_amount:  book.price.to_i * 100,
    #             product_data: {
    #                 name: book.bname,
    #             },
    #         }
    #     }],
    #     mode: 'payment',
    #     success_url: "http://localhost:3000/books",
    #     cancel_url: "http://localhost:3000/books",
    #    })
    #    respond_to do |format|
    #     format.js
    #    end
    # end

    # def success 
    #     @order=session[:order]
    #     @order_id= @order.lineitems["id"]
    #     @user_order = UserBook.new 
    #     @user_order.user_id = current_user.id 
    #     @user_order.lineitems_id = @order_id
    #     if @user_order.save
    #         flash[:notice] ="Successfully purchased"
    #         redirect_to books_path
    #     else 
    #         flash[:notice] = "Enter again"
    #         redirect_to checkout_create_path
    #     end
       
    # end
    
   
    # @order.update(state: 3)

end