class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy cart]
  before_action :authenticate_user!, only: %i[ cart ]
  # GET /products or /products.json
  def index
    @products = Product.all
  end
  # GET /products/1 or /products/1.json
  def show
  end
  # GET /products/new
  # def new
  #   @product = Product.new({:Catageroy_id=>params[:cid]})
  # end
  # GET /products/1/edit
  def edit
  end
  # POST /products or /products.json
  # def create
  #   @product = Product.new(product_params)

  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to admin_catageroys_path, notice: "Product was successfully created." }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admim_catageroys_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to catageroys_path(@product.Catageroy_id), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end






   def cart
       
     # redirect_to catageroy_path(@product.Catageroy_id)
       if Cart.create(:user=>current_user.email, :cid=>@product.Catageroy_id, :pid=>@product.id, :aqty=>@product.qty, :quantity=>1,:title=>@product.title, :price=>@product.price)
       respond_to do |format|
         format.html { redirect_to catageroy_path(@product.Catageroy_id), notice: "Product was successfully Add to Cart." }
         format.json { head :no_content }
       end
     end
   end








  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :des, :qty, :Catageroy_id, :price, :f_image)
    end
end
