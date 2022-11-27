class Order < ApplicationRecord
  belongs_to :dish, inverse_of: :orders

  # Se agregan atributos virtuales para poder crear un pedido.
  # Estos simplemente sirven para almacenar el filtro de búsqueda, pero no se
  # persisten (son attr_accessors comunes que solo guardan en @variables_de_instancia).
  attr_accessor :restaurant_id, :menu_id

  validates :name, presence: true

  def restaurant
    @restaurant ||= Restaurant.find(restaurant_id) if restaurant_id.present?
  end

  def menu
    @menu ||= restaurant.menus.find(menu_id) if restaurant_id.present? && menu_id.present?
  end
end
