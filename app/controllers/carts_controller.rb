class CartsController < ApplicationController
  def index
     @cart = Cart.all
     
  end



  def show
    @cart = Cart.all
    if @cart
      @cart.each do |c|
        if Order.create(:user=>c.user, :title=>c.title, :cid=>c.cid, :pid=>c.pid, :price=>c.price, :quantity=>c.quantity)

          @p = Product.find(c.pid)
          @p.qty =@p.qty - c.quantity
          @p.update(:qty =>@p.qty)
          Cart.find(c.id).destroy
        end
      end
      @email="ranaahmadraza1155@gmail.com"
      PostmMailer.with(order: @email ).post_created.deliver_now
      redirect_to catageroys_path
    end
  end


  def new
    # cart = Product.all
    # render json: cart
  end

 def sub
  @cart = Cart.find(params[:id])
    @pro =Product.find(@cart.pid)
      if  @cart.quantity > 1
        if @cart.update(:quantity=>@cart.quantity-1)
          redirect_to carts_path
        end
       else
          redirect_to carts_path
      end
 end

  def edit
    @cart = Cart.find(params[:id])
    if @cart
      @pro =Product.find(@cart.pid)
    end
      if @pro.qty > @cart.quantity
        if @cart.update(:quantity=>@cart.quantity+1)
          redirect_to carts_path
        end
       else
          redirect_to carts_path
      end

  end



 def destroy
   @cart =Order.find(params[:id])
   if @cart.destroy
     redirect_to carts_path
   end
 end
end
