class Admin::CatageroysController < Admin::BaseController
  before_action :set_catageroy, only: %i[ show edit update destroy ]
  before_action :check, only: %i[ index new show edit update destroy ]
  # GET /catageroys or /catageroys.json
  def index
    @catageroys = Catageroy.all
    @product = Product.all
    @order = Order.all
  end

  # GET /catageroys/1 or /catageroys/1.json
  def show
  end

  # GET /catageroys/new
  def new
    @catageroy = Catageroy.new
  end

  # GET /catageroys/1/edit
  def edit
    
  end

  # POST /catageroys or /catageroys.json
  def create
    @catageroy = Catageroy.new(catageroy_params)

    respond_to do |format|
      if @catageroy.save
        format.html { redirect_to new_admin_catageroy_path, notice: "Catageroys was successfully created." }
        format.json { render :show, status: :created, location: @catageroy }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catageroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catageroys/1 or /catageroys/1.json
  def update
     @catageroy.update(catageroy_params)
    respond_to do |format|
      if @catageroy.update(catageroy_params)
        format.html { redirect_to new_admin_catageroy_path, notice: "Catageroy was successfully updated." }
        format.json { render :show, status: :ok, location: @catageroy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catageroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catageroys/1 or /catageroys/1.json
  def destroy
    @catageroy.destroy

    respond_to do |format|
      format.html { redirect_to catageroys_url, notice: "Catageroy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catageroy
      @catageroy = Catageroy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catageroy_params
      params.require(:catageroy).permit(:name)
    end


    def check
      if current_user && current_user.role == "admin"
        puts "Admin :"
        puts current_user.role
        

      else
        puts "Admin not Exist"
        redirect_to new_user_session_path
      end
    end
end
