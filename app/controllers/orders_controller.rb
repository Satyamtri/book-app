class OrdersController < ApplicationController
    
    def index
       
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
        redirect_to books_path
    end

    def add_to_cart
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
        book = Book.find(params[:format])
        book_price = book.price * params[:quantity].to_i
        @order.lineitems.create(book_id: params[:format], price: book_price, purchase_type: "buy", quantity: params[:quantity])
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
        @address = @user.address
        @order = @user.orders.last
        # @order.update(state: 1)
    end

    def edit
       @user = current_user
        @address = @user.address
    end

    def update_address
       
        @address = Address.find(params[:format].to_i)
        if @address.update(params.require(:address).permit(:first_name, :last_name, :contactnumber, :pincode, :city, :state, :country, :landmark, :user_id))
            redirect_to @address
        else
            render 'edit'
        end
    end

    def add_to_rent
    
        if  check_incomplete_order.present? 
            @order = check_incomplete_order
        else
            @order = current_user.orders.create
        end 
        book = Book.find(params[:format])
        book_price_per_day = book.price * 0.07
        # book_price = book.price   
        calc_rent = params[:time_period].to_i * book_price_per_day.to_i
        @order.lineitems.create(book_id: params[:format], price: calc_rent , purchase_type: "rent", time_period: params[:time_period])
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