class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # Esta guarda es la que determina si se intenta crear una Order (etapa final) o no.
    # Si no se tiene toda la info necesaria, se muestra la vista 'new' y ahí se decide qué
    # campos mostrar (dependiendo de si se tiene o no el restaurant_id, el menu_id, etc).
    unless @order.restaurant_id.present? && @order.menu_id.present? && @order.dish.present?
      return render 'new'
    end
    if @order.save
      redirect_to orders_path, notice: "Order ##{@order.id} was successfully created."
    else
      flash.now[:error] = 'There was an error creating the order.'
      render 'new'
    end
  end

  protected

  def order_params
    # Acá se permiten todos los parámetros del formulario (incluimos los atributos que no
    # son parte del modelo en sí, pero que usaremos como "filtro" para la búsqueda).
    params.require(:order).permit(:name, :restaurant_id, :menu_id, :dish_id, :comments)
  end
end
