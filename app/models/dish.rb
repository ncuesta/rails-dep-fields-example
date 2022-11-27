class Dish < ApplicationRecord
  belongs_to :menu, inverse_of: :dishes
  has_many :orders, inverse_of: :dish

  def to_s
    name
  end
end
