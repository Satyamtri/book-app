class OrdersController < ApplicationController
    
    def index
       @orders = Order.all
       @orders = Order.paginate(page: params[:page], per_page: 2)
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def new
        @order = Order.new
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to orders_path
    end

    def add_to_cart
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
        book = Book.find(params[:format])
        book_price = book.price 
        total_price =  book.price * params[:quantity].to_i 
        
        #Check current product in lineitem
        
        books_id = @order.lineitems.pluck(:book_id)
        if books_id.include?(book.id)
           current_lineitem =  @order.lineitems.where(book_id: book.id).last
           current_lineitem.update(quantity: (params[:quantity].to_i + current_lineitem.quantity).to_s, total_price: total_price + (book.price * current_lineitem.quantity).to_i)
        else 
            @order.lineitems.create(book_id: params[:format], price: book_price, purchase_type: "buy", quantity: params[:quantity], total_price: total_price)
        end 
        redirect_to cart_path
    end 

    def cart
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
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
        @addresses = @user.addresses
        @order = @user.orders.last  
    end

    def delete_address
        @address=Address.find(params[:address].to_i)
        @address.destroy
        flash[:notice]="Address is deleted"
        redirect_to address_path
    end

    def add_to_rent
    
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
        book = Book.find(params[:format])
        book_price = book.price   
        # book_price_per_day = book.price * 0.2 * params[:time_period].to_i
        book_price_per_day = params[:time_period].to_i * (book_price * 0.2)
        total_price = book_price + book_price_per_day
        @order.lineitems.create(book_id: params[:format], price: book_price , purchase_type: "rent", time_period: params[:time_period], total_price: total_price)
        redirect_to cart_path
    end

    def rent
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
    end

    private
    
    def order_params
        params.require(:order).permit(:name, :email, :address, :pay_method)
    end

    def check_incomplete_order
        current_user.orders.where.not(state: "complete").last
    end 
      
end