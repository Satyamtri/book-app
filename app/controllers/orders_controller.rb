class OrdersController < ApplicationController
    def index
        @orders = Order.all
        # @order= @order.lineitems
        # @book = Book.all  
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def new
        @order = Order.new
    end

    def add_to_cart
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
        book = Book.find(params[:format])
        book_price = book.price
        @order.lineitems.create(book_id: params[:format], price: book_price)
        redirect_to cart_path

    end 

    def cart
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.order.create
        end 
    end 

    def address_form
      @address = Address.new
        
    end

    def add_address   
    
        @address = Address.new(params.require(:address).permit(:first_name, :last_name, :contactnumber, :pincode, :city, :state, :country, :landmark, :user_id))
        @address.save
        redirect_to address_path
       
    end

    def address
       @user = current_user
       @address = @user.addresses
       # @addresses = Address.all
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to books_path
    end
      
    
    private
    
    def order_params
        params.require(:order).permit(:name, :email, :address, :pay_method)
    end

    def check_incomplete_order
        current_user.orders.where(state: "cart").last
    end 

    def check_exist_address
        current_user.addresses

    end
      
end