class LineitemsController < ApplicationController
  def index
    @lineitems = Lineitem.all
  end

  def show
    # @lineitem = Lineitem.find(params[:id])
    @user = current_user
    @books = @user.books
  end

  def create
    @lineitem = Lineitem.new(lineitem_params)
    @lineitem.user = current_user
    if @lineitem.save
      flash[:notice] = "Book successfully added"
      redirect_to cart_path
    else
      render 'new'
    end
  end

  def destroy 
     @lineitem = Lineitem.find(params[:id])
     @lineitem.destroy
     redirect_to cart_path
  end


  private
    
    def lineitem_params
        params.require(:lineitem).permit(:book_id, :order_id, :price, :quantity, :total_price, :purchase_type, :time_period)
    end
  
end
