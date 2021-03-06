class CartsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  before_action :set_cart, only: [:destroy]

  # GET /carts
  # GET /carts.json
  def index
    @cart = current_user.carts.get_active_cart
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    if current_user.carts.empty? or current_user.carts.last.done
      @cart = current_user.carts.build
      @cart.save!
    else
      @cart = current_user.carts.last
    end
    @cart.add(@product, @product.price)
    @cart.save

    redirect_to @product
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.remove(@product)
    redirect_to carts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
