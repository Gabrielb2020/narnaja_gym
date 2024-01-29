class ProductosController < ApplicationController
  before_action :set_producto, only: %i[show edit update destroy]

  def index
    @productos = Producto.all
  end

  def show
    authorize @producto
  end

  def new
    @producto = Producto.new
    authorize @producto
  end

  def edit
    authorize @producto
  end

  def create
    @producto = Producto.new(producto_params)
    authorize @producto

    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_url(@producto), notice: "Producto was successfully created." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @producto

    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: "Producto was successfully updated." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @producto
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Producto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_producto
    @producto = Producto.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:name, :description, :photo, :price)
  end
end
