class MainController < ApplicationController
  def home
  end

  def home
    @productos = Producto.all
    authorize :producto
  end
end
